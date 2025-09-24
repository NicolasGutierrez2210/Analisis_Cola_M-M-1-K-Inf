# Modelo M/M/1/K y Comparaciones en Mesa

Este repositorio contiene el desarrollo del modelo matematico y las simulaciones basadas en agentes
para el sistema de colas **M/M/1/K** y su comparacion con el caso **M/M/1/∞**.

## Contenido del repositorio

### 1. [modelo_matematico/](./data)
- Incluye el documento **Informe_Modelo_M_M_1_K.pdf** con el desarrollo completo del modelo matematico.
- El PDF contiene las formulas, deducciones y los calculos.
- Una breve explicacion esta en el `README.md` de esa carpeta.

### 2. [comparaciones_mesa/](./mesas_comparacion)
- Simulaciones realizadas en **Python con Mesa**.  
- Incluye un enlace a un **Google Colab** que ejecuta el modelo con distintos parametros.  
- Se presentan comparaciones entre:  
  - **M/M/1/K (sistema con perdidas)**  
  - **M/M/1/∞ (sistema con espera infinita)**  

## Objetivo
El objetivo es contrastar los resultados obtenidos analiticamente (modelo matematico) con los obtenidos por simulacion basada en agentes (Mesa), para validar y visualizar el comportamiento de los sistemas de colas.

---

## Conclusiones del analisis

1. **Consistencia teoria vs simulacion**  
   - Los valores calculados en el modelo matematico y los obtenidos en la simulacion con Mesa son coherentes.  
   - Las pequenas diferencias se deben a la variabilidad aleatoria y al tiempo de simulacion finito, lo cual es normal en este tipo de experimentos.  

2. **Sistemas con perdidas (M/M/1/K)**  
   - Cuando la tasa de llegada lambda es baja, casi no hay bloqueos.  
   - A medida que lambda se acerca o supera mu, la probabilidad de bloqueo aumenta significativamente.  
   - La **congestion** se refleja directamente en la proporcion de clientes rechazados.  

3. **Sistemas con espera infinita (M/M/1/∞)**  
   - No hay bloqueos, todos los clientes son aceptados.  
   - La congestion se refleja en el aumento de `Tw` (tiempo en cola) y `Ts` (tiempo en el sistema).  
   - Bajo alta carga, aunque no se rechacen clientes, el sistema puede volverse impractico por las largas esperas.  

4. **Valor agregado de la simulacion basada en agentes**  
   - Permite visualizar dinamicamente la evolucion de la cola y la congestion en el tiempo.  
   - Hace evidente el contraste entre sistemas con perdidas y sistemas con espera infinita, algo que en la teoria queda resumido solo en formulas.  

5. **Conclusion general**  
   - El analisis muestra que **ningun sistema es perfecto**:  
     - En **M/M/1/K** se pierden clientes cuando la demanda supera la capacidad.  
     - En **M/M/1/∞** no se pierden clientes, pero las esperas se hacen largas e ineficientes.  
   - La eleccion de uno u otro depende del contexto:  
     - Si rechazar clientes es inaceptable -> conviene un sistema de espera.  
     - Si las esperas largas son inaceptables -> conviene un sistema de perdidas con capacidad definida.  

---

