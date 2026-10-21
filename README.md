# Práctica: Comunicación entre Activities mediante Intent con Datos

Este proyecto pertenece al repositorio de la asignatura **Desarrollo de Aplicaciones Móviles** y contiene una aplicación nativa en Android desarrollada en Kotlin que demuestra la transferencia segura de datos entre diferentes componentes de la interfaz de usuario utilizando `Intent`.

---

## 📁 Estructura del Módulo
El proyecto se encuentra organizado dentro de la carpeta:
* `nueva_activiti_class-1.pp/`

---

## 🛠️ Auditoría Técnica y Mejoras Arquitectónicas Realizadas

Originalmente, el proyecto contenía la lógica básica para comunicar dos pantallas, pero presentaba vulnerabilidades y acoplamientos que no cumplían con las directrices de código limpio de Android. Se han realizado las siguientes implementaciones avanzadas:

### 1. Enlace de Vistas Seguro con View Binding
* **Problema:** El uso convencional de `findViewById` es propenso a errores en tiempo de ejecución (excepciones de tipo nulo) y ralentiza el inflado de la jerarquía de vistas.
* **Solución:** Se habilitó el soporte nativo de **View Binding** en el archivo `build.gradle.kts` del módulo de la aplicación. Ahora todas las referencias a los componentes gráficos se resuelven de forma estática y tipada, garantizando la seguridad del código frente a modificaciones del layout.

### 2. Eliminación de Claves Hardcodeadas (Evitar Erratas)
* **Problema:** El identificador del `Intent.putExtra()` era una cadena literal `"CLAVE_MENSAJE"` repetida manualmente tanto en la actividad que enviaba el mensaje como en la que lo recibía.
* **Solución:** Se extrajo la clave a una constante estática de alcance global (`EXTRA_MENSAJE`) encapsulada en el `companion object` de la clase destino `SegundaActivity`. De este modo, cualquier cambio o refactorización del identificador se realiza en un único punto centralizado.

### 3. Validación Temprana y Sanitización de Datos
* **Problema:** La aplicación permitía lanzar la segunda pantalla transmitiendo texto en blanco o solo espacios si el usuario presionaba el botón de acción sin rellenar el formulario.
* **Solución:** Se integró un flujo de validación en `MainActivity` que sanitiza el texto usando `.trim()`. Si el campo queda vacío, se interrumpe la navegación y se notifica al usuario mediante un estado visual de error en el propio `EditText` (`.error`) acompañado de un mensaje emergente `Toast`.

### 4. Internacionalización y Externalización de Recursos (I18n)
* **Problema:** Los textos visibles y las cadenas informativas estaban incrustados directamente en el código Kotlin y en los layouts XML.
* **Solución:** Se migraron y ordenaron todos los textos literales dentro del archivo centralizado de recursos `strings.xml`. Esto optimiza el mantenimiento del proyecto y sienta las bases para soportar múltiples idiomas en el futuro.

---

## 🚀 Verificación y Control de Calidad
* **Compilación:** Verificada de forma local mediante Gradle mediante la tarea `:app:assembleDebug`, arrojando un resultado exitoso libre de advertencias críticas de sintaxis.
* **Pruebas:** Se ejecutó con éxito la suite de pruebas unitarias (`:app:testDebugUnitTest`), validando la integridad estructural del proyecto.
