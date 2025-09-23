globals [
  ;; tiempos y eventos
  t
  next-arrival
  next-departure
  
  ;; estructura del sistema
  queue
  server-busy
  current-arrival-time
  
  ;; estadísticas
  total-arrivals
  served-customers
  blocked-arrivals
  sum-Ts             ;; suma de tiempos en el sistema
  Ns-accum           ;; área bajo N(t)
  last-event-time

  ;; parámetros
  ;; tiempo de calentamiento
]

;; -------- SETUP --------
to setup
  clear-all
  
  ;; inicialización
  set t 0
  set queue []
  set server-busy false
  set current-arrival-time 0
  
  set total-arrivals 0
  set served-customers 0
  set blocked-arrivals 0
  set sum-Ts 0
  set Ns-accum 0
  set last-event-time 0

  set warmup-time 1000   ;; tiempo para llegar a estado estable
  
  ;; generar primer arribo
  set next-arrival random-exponential (1 / arrival-rate)
  set next-departure 1.0E99
  
  reset-ticks
end

;; -------- GO --------
to go
  if t >= sim-time [
    report-results
    stop
  ]
  
  ;; seleccionar siguiente evento
  let next-event min list next-arrival next-departure
  let delta (next-event - t)
  
  ;; actualizar área bajo N(t) solo después del warmup
  let N length queue + (ifelse-value server-busy [1] [0])
  if t > warmup-time [
    set Ns-accum Ns-accum + N * delta
  ]
  set last-event-time next-event
  
  ;; avanzar en el tiempo
  set t next-event
  tick-advance delta
  
  if next-arrival = t [ process-arrival ]
  if next-departure = t [ process-departure ]
end

;; -------- LLEGADA --------
to process-arrival
  set total-arrivals total-arrivals + 1
  
  let N length queue + (ifelse-value server-busy [1] [0])
  
  if N < K [
    ifelse not server-busy [
      ;; entra directo al servidor
      set server-busy true
      set current-arrival-time t
      set next-departure t + random-exponential (1 / mu)
    ] [
      ;; se va a la cola
      set queue lput t queue
    ]
  ] 
  
  if N >= K [
    set blocked-arrivals blocked-arrivals + 1
  ]
  
  set next-arrival t + random-exponential (1 / arrival-rate)
end

;; -------- SALIDA --------
to process-departure
  set served-customers served-customers + 1
  if t > warmup-time [
    set sum-Ts sum-Ts + (t - current-arrival-time)
  ]
  
  ifelse not empty? queue [
    set current-arrival-time first queue
    set queue but-first queue
    set next-departure t + random-exponential (1 / mu)
  ] [
    set server-busy false
    set next-departure 1.0E99
  ]
end

;; -------- RESULTADOS --------
to report-results
  let lambda-ef served-customers / (t - warmup-time)   ;; tasa efectiva
  let NS Ns-accum / (t - warmup-time)                 ;; clientes promedio en el sistema
  let TS sum-Ts / served-customers                    ;; tiempo promedio en el sistema
  let Tw TS - (1 / mu)                                ;; tiempo promedio en cola
  let Nw Tw * lambda-ef                               ;; clientes promedio en cola
  
  print (word "Total llegadas: " total-arrivals)
  print (word "Total servidos: " served-customers)
  print (word "Total bloqueados: " blocked-arrivals)
  print (word "NS (usuarios en el sistema): " NS)
  print (word "TS (tiempo en el sistema): " TS)
  print (word "Tw (tiempo en cola): " Tw)
  print (word "Nw (usuarios en cola): " Nw)
end


