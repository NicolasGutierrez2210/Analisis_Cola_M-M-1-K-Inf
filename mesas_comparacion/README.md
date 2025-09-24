#  Carpeta: Comparaciones (simulación en Python/Mesa)

En esta carpeta se documentan las simulaciones realizadas con **Mesa (Python)** para comparar los dos escenarios de colas:

- **M/M/1/k (sistema de pérdidas)**  
- **M/M/1/∞ (sistema de espera infinita)**  

Cada ejecución genera métricas de interés:  
- `NS` → número promedio en el sistema  
- `TS` → tiempo promedio en el sistema  
- `Tw` → tiempo promedio en cola  

##  Colab principal
El código completo y todas las simulaciones están implementados en un único **Google Colab**:  

 [Abrir el Colab de simulación](https://colab.research.google.com/drive/1I099hLlR9XGvZPCy2jEfwChlonQHhIdh?usp=sharing)



## Contenido
- El Colab incluye:
  - Definición de agentes (`Cliente`, `Servidor`) y del modelo (`SistemaColas`).  
  - Ejecución de las simulaciones con distintos parámetros de λ y μ.  
  - Gráficas comparativas (barras y evolución temporal de la cola).  
- Todos los resultados y figuras se obtienen directamente al ejecutar el notebook.  

## Nota
Esta carpeta se usa solo para documentar y enlazar el Colab; **los datos y gráficas no se almacenan aquí**, sino que se generan dinámicamente desde el notebook.


