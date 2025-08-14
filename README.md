# bd_fundacion
Caso Propuesto: Segmentación de Donantes para la Fundación "Manos Solidarias"

En base al tema elegido plantear un caso referente a bases de datos.
Contexto:
La fundación Manos Solidarias es una organización sin fines de lucro que recauda
fondos mediante campañas y donaciones individuales para apoyar programas de
salud, educación y asistencia social. En los últimos años, ha notado que algunas
campañas tienen más éxito que otras y que ciertos perfiles de donantes donan con
más frecuencia o mayor monto. Por eso, han decidido diseñar una base de datos
centralizada para analizar y segmentar a sus donantes, con el objetivo de optimizar
futuras campañas y fidelizar a los donantes.

Objetivo del Caso:
Diseñar una base de datos relacional que permita:
Registrar a los donantes, sus características sociodemográficas y comportamiento de
donación.
Registrar campañas de recaudación y eventos especiales.
Asociar cada donación con su campaña o canal.
Facilitar análisis posteriores para segmentación y predicción de comportamiento.

Requisitos del Sistema:
Donantes:
• Cada donante debe estar identificado por un ID único.
• Se debe registrar: nombre completo, género, fecha de nacimiento, correo,
teléfono, ciudad, país, profesión y nivel educativo.
• También se registra su preferencia de contacto (email, teléfono, redes
sociales).

Campañas de Recaudación:
• Cada campaña tiene un ID único, nombre, descripción, tipo (educación, salud,
emergencia, etc.), fecha de inicio y fecha de fin.

Donaciones:
• Cada donación tiene un ID único.
• Se registra el donante, la fecha, el monto donado, el método de pago
(transferencia, tarjeta, efectivo, débito automático).

• Se debe asociar con la campaña si aplica (puede haber donaciones
espontáneas sin campaña).
• Se registra también el canal (web, presencial, redes sociales, llamada
telefónica).

Eventos:
• La fundación organiza eventos presenciales y virtuales (conciertos, subastas,
caminatas).
• Se desea registrar la participación de donantes en los eventos.
• Para cada evento: nombre, tipo, fecha, lugar, número de asistentes estimados.

Segmentación (posterior):
• La estructura debe permitir identificar patrones como:
• Frecuencia de donación.
• Monto total anual.
• Preferencias de campaña.
• Participación en eventos.
• Datos demográficos relevantes.

Entregables esperados (según nivel):
• Diagrama Entidad-Relación (MER) detallado.
• Modelo Relacional normalizado (3FN).
• Scripts SQL para la creación de tablas.
• Datos de ejemplo para poblar la base (opcional).
• Consultas SQL sugeridas:
o ¿Quiénes son los donantes más frecuentes?
o ¿Qué campañas generaron más ingresos?
o ¿Qué canal de donación es más utilizado?
o ¿Cuál es el perfil demográfico de los donantes de alto valor?

Sugerencia de entidades y relaciones:
• Donante (1:N) Donación
• Campaña (1:N) Donación
• Evento (N:M) Donante → tabla intermedia: Participación
• Canal, MétodoPago: tablas de catálogo para normalizar

Plantear un caso referente a una Solución BI.

Objetivos del Proyecto BI:
1. Desarrollar un Data Warehouse (DW) que integre las fuentes de datos de
campañas, donaciones, donantes y eventos.
2. Diseñar cubos OLAP o modelos tabulares que permitan explorar los datos
por dimensiones clave: tiempo, campaña, canal, tipo de donante, ubicación
geográfica, etc.
3. Implementar dashboards e informes interactivos en una herramienta como
Power BI, Tableau o Google Data Studio.
4. Realizar segmentación basada en comportamiento de donación y
características sociodemográficas.
5. Monitorear KPIs estratégicos, como:
o Monto total donado por mes/año.
o Crecimiento en número de donantes.
o Retención vs. abandono.
o ROI por campaña.
o Donantes de alto valor.

Requisitos Funcionales:
1. Extracción de Datos (ETL):
• Origen: Base de datos transaccional relacional (caso anterior).
• Transformación: Limpieza de duplicados, formatos de fechas, homologación de
métodos de pago, unificación de nombres de campañas.
• Carga: A un modelo dimensional en un Data Warehouse.
2. Modelo Dimensional Sugerido (Esquema Estrella):
• Hecho: Donación
o Monto
o Fecha
o Campaña ID
o Donante ID
o Canal ID
o Método de Pago ID
• Dimensiones:
o Tiempo (año, mes, semana)

o Donante (edad, género, ciudad, profesión, nivel educativo)
o Campaña (nombre, tipo, fechas)
o Canal (web, presencial, redes, llamada)
o Evento (asociación opcional si es una campaña-evento)
o Método de Pago (tarjeta, transferencia, etc.)

3. KPIs e Indicadores Clave:
• Total recaudado por campaña
• Tasa de conversión de campañas (donantes vs. contactados)
• Recaudación por canal
• % de participación en eventos vs. donación
• Ciclo de vida de donante (tiempo entre primeras y últimas donaciones)
• Donantes nuevos vs. recurrentes
• Segmentación RFM (Recencia, Frecuencia, Monto)
Ejemplos de Dashboards Requeridos:
1. Dashboard Ejecutivo
o Total recaudado este año vs. anterior
o Donantes activos por mes
o Campañas más efectivas
o Mapa geográfico de donaciones
2. Perfil de Donantes
o Distribución por género, edad, ciudad, profesión
o Monto promedio donado según perfil
o Segmentos RFM destacados
3. Análisis de Campañas
o Campañas con mayor ROI
o Comparativo entre canales de captación
o Evolución temporal de recaudación por campaña
4. Retención y Fidelización
o Tasa de retención mensual
o Tiempo promedio entre donaciones
o Donantes inactivos por más de 6 meses
