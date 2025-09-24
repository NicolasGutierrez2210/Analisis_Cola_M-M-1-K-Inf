#  Carpeta: Comparaciones (simulacion en Python/Mesa)

En esta carpeta se documentan las simulaciones realizadas con **Mesa (Python)** para comparar los dos escenarios de colas:

- **M/M/1/k (sistema de perdidas)**  
- **M/M/1/∞ (sistema de espera infinita)**  

Cada ejecucion genera metricas de interes:  
- `NS` → numero promedio en el sistema  
- `TS` → tiempo promedio en el sistema  
- `Tw` → tiempo promedio en cola  

##  Colab principal
El codigo completo y todas las simulaciones estan implementados en un unico **Google Colab**:  

 [Abrir el Colab de la simulacion](https://colab.research.google.com/drive/1I099hLlR9XGvZPCy2jEfwChlonQHhIdh?usp=sharing)

## Contenido
- El Colab incluye:
  - Definicion de agentes (`Cliente`, `Servidor`) y del modelo (`SistemaColas`).  
  - Ejecucion de las simulaciones con distintos parametros de lambda y mu.  
  - Graficas comparativas (barras y evolucion temporal de la cola).  
- Todos los resultados y figuras se obtienen directamente al ejecutar el notebook.  

## Nota
Esta carpeta se usa solo para documentar y enlazar el Colab; **los datos y graficas no se almacenan aqui**, sino que se generan dinamicamente desde el notebook.

---

## Como instalar y usar NetLogo

1. **Descargar NetLogo**  
   - Ir a la pagina oficial: [https://ccl.northwestern.edu/netlogo/](https://ccl.northwestern.edu/netlogo/)  
   - Descargar la version para tu sistema operativo (Windows, Mac o Linux).  
   - Instalar NetLogo normalmente.  

2. **Abrir el modelo**  
   - Iniciar NetLogo.  
   - Seleccionar en el menu: `File -> Open...`.  
   - Buscar el archivo `.nlogo` incluido en la carpeta del proyecto   
   - Hacer clic en **Abrir**.  

3. **Ejecutar el modelo**  
   - Presionar **Setup** para inicializar.  
   - Presionar **Go** para ejecutar la simulacion.  
   - Ajustar los sliders de parametros (lambda, mu, capacidad K) segun lo que se desee probar.  
   - Observar la evolucion de la cola en los monitores y graficas de la interfaz.  

4. **Notas**  
   - El archivo `.nlogo` ya contiene la interfaz y los procedimientos `setup` y `go`.  
   - El codigo puede modificarse desde la pestana **Code** para experimentar con cambios propios.  

