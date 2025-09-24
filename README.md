# 📊 Modelo M/M/1/K y Comparaciones en Mesa

Este repositorio contiene el desarrollo del modelo matemático y las simulaciones basadas en agentes
para el sistema de colas **M/M/1/K** y su comparacion con el caso **M/M/1/∞**.

## 📂 Contenido del repositorio

### 1. [modelo_matematico/](./data)
- Incluye el documento **Informe_Modelo_M_M_1_K.pdf** con el desarrollo completo del modelo matematico.
- El PDF contiene las formulas, deducciones y  los calculos .
- Una breve explicacion está en el `README.md` de esa carpeta.

### 2. [comparaciones_mesa/](./comparaciones_mesa)
- Simulaciones realizadas en **Python con Mesa**.  
- Incluye un enlace a un **Google Colab** que ejecuta el modelo con distintos parámetros.  
- Se presentan comparaciones entre:  
  - **M/M/1/K (sistema con pérdidas)**  
  - **M/M/1/∞ (sistema con espera infinita)**  

## Objetivo
El objetivo es contrastar los resultados obtenidos analíticamente (modelo matemático) con los obtenidos por simulacion basada en agentes (Mesa), para validar y visualizar el comportamiento de los sistemas de colas.

---

## Conclusiones del analisis

1. **Consistencia Teoría vs. Simulación**  
   - Los valores calculados en el modelo matemático y los obtenidos en la simulación con Mesa son coherentes.  
   - Las pequeñas diferencias se deben a la variabilidad aleatoria y al tiempo de simulación finito, lo cual es normal en este tipo de experimentos.  

2. **Sistemas con pérdidas (M/M/1/K)**  
   - Cuando la tasa de llegada λ es baja, casi no hay bloqueos.  
   - A medida que λ se acerca o supera μ, la probabilidad de bloqueo aumenta significativamente.  
   - La **congestión** se refleja directamente en la proporción de clientes rechazados.  

3. **Sistemas con espera infinita (M/M/1/∞)**  
   - No hay bloqueos, todos los clientes son aceptados.  
   - La congestión se refleja en el aumento de `Tw` (tiempo en cola) y `Ts` (tiempo en el sistema).  
   - Bajo alta carga, aunque no se rechacen clientes, el sistema puede volverse impráctico por las largas esperas.  

4. **Valor agregado de la simulación basada en agentes**  
   - Permite visualizar dinámicamente la evolución de la cola y la congestión en el tiempo.  
   - Hace evidente el contraste entre sistemas con pérdidas y sistemas con espera infinita, algo que en la teoría queda resumido solo en fórmulas.  

5. **Conclusión general**  
   - El análisis muestra que **ningún sistema es perfecto**:  
     - En **M/M/1/K** se pierden clientes cuando la demanda supera la capacidad.  
     - En **M/M/1/∞** no se pierden clientes, pero las esperas se hacen largas e ineficientes.  
   - La elección de uno u otro depende del contexto:  
     - Si rechazar clientes es inaceptable → conviene un sistema de espera.  
     - Si las esperas largas son inaceptables → conviene un sistema de pérdidas con capacidad definida.  

---

