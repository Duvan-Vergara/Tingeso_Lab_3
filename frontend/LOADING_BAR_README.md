# Barra de Carga Global - LoadingBar

Este sistema proporciona una barra de carga global que se muestra en la parte superior de la aplicación durante las operaciones asíncronas.

## Características

- **Barra de progreso visual**: Se muestra en la parte superior de la pantalla
- **Mínimo tiempo visible**: Aunque la operación sea muy rápida, la barra se muestra al menos 300ms para que sea visible
- **Progreso animado**: La barra se llena progresivamente, más rápido al inicio y más lenta al final
- **Múltiples operaciones**: Maneja múltiples operaciones concurrentes correctamente

## Componentes Incluidos

### LoadingProvider
Proveedor del contexto que debe envolver toda la aplicación (ya integrado en App.jsx).

### LoadingBar
Componente visual de la barra de carga (ya integrado en App.jsx).

### useLoading
Hook para acceder al estado de carga global.

### useAsyncLoading
Hook para ejecutar operaciones asíncronas con carga automática.

## Cómo Usar

### 1. Para operaciones asíncronas simples

```jsx
import { useAsyncLoading } from '../LoadingBar';

function MiComponente() {
  const { executeWithLoading } = useAsyncLoading();

  const handleClick = () => {
    executeWithLoading(async () => {
      // Tu operación asíncrona aquí
      const response = await miServicio.obtenerDatos();
      // Procesar respuesta
    });
  };

  return <button onClick={handleClick}>Cargar Datos</button>;
}
```

### 2. Para cargar datos en useEffect

```jsx
import { useAsyncLoading } from '../LoadingBar';

function MiComponente() {
  const { executeWithLoading } = useAsyncLoading();
  const [datos, setDatos] = useState([]);

  useEffect(() => {
    const cargarDatos = async () => {
      executeWithLoading(async () => {
        try {
          const response = await miServicio.obtenerTodos();
          setDatos(response.data);
        } catch (error) {
          // Manejar error
        }
      });
    };
    
    cargarDatos();
  }, [executeWithLoading]);

  return <div>{/* Renderizar datos */}</div>;
}
```

### 3. Para acceder al estado de loading (opcional)

```jsx
import { useLoading } from '../LoadingBar';

function MiComponente() {
  const { isLoading } = useLoading();

  return (
    <button disabled={isLoading}>
      {isLoading ? 'Cargando...' : 'Enviar'}
    </button>
  );
}
```

### 4. Para formularios

```jsx
import { useAsyncLoading } from '../LoadingBar';

function FormularioUsuario() {
  const { executeWithLoading } = useAsyncLoading();

  const handleSubmit = (event) => {
    event.preventDefault();
    
    executeWithLoading(async () => {
      try {
        await userService.guardarUsuario(datosFormulario);
        navigate('/usuarios');
      } catch (error) {
        mostrarError('Error al guardar usuario');
      }
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      {/* Campos del formulario */}
      <button type="submit">Guardar</button>
    </form>
  );
}
```

## Componentes Ya Integrados

Los siguientes componentes ya tienen la barra de carga integrada:

- ✅ `ReserveList.jsx` - Lista de reservas
- ✅ `ReportGenerator.jsx` - Generador de reportes
- ✅ `Rack.jsx` - Rack semanal
- ✅ `AddEditUser.jsx` - Formulario de usuarios
- ✅ `useListOperations.jsx` - Operaciones de listas (eliminación)
- ✅ `GenericList.jsx` - Lista genérica

## Componentes Pendientes

Para completar la integración, puedes aplicar el mismo patrón a:

- `AddEditReserve.jsx`
- `AddEditTariff.jsx`
- `AddEditTariffSpecial.jsx`
- `AddEditSpecialDay.jsx`
- `AddEditDesctNumber.jsx`
- `AddEditDesctFrec.jsx`
- `TariffList.jsx`
- `TariffSpecialList.jsx`
- `SpecialDayList.jsx`
- `DesctNumberList.jsx`
- `DesctFrecList.jsx`
- `UsersList.jsx`

## Pasos para Integrar en Otros Componentes

1. **Importar el hook**:
   ```jsx
   import { useAsyncLoading } from '../LoadingBar';
   ```

2. **Usar el hook en el componente**:
   ```jsx
   const { executeWithLoading } = useAsyncLoading();
   ```

3. **Envolver operaciones asíncronas**:
   ```jsx
   executeWithLoading(async () => {
     // Tu código asíncrono aquí
   });
   ```

4. **Remover estados de loading locales** (si los hay):
   - Eliminar `useState` para loading
   - Remover `setLoading(true/false)`
   - Usar `useLoading()` si necesitas acceder al estado

## Notas Importantes

- ⚠️ **No uses `executeWithLoading` en paralelo** para la misma operación
- ✅ **Es seguro usar múltiples `executeWithLoading`** concurrentemente 
- ✅ **La barra se muestra automáticamente** cuando hay al menos una operación activa
- ✅ **Se oculta automáticamente** cuando todas las operaciones terminan

## Personalización

Puedes personalizar la apariencia de la barra editando el componente `LoadingBar.jsx`:

- Cambiar colores en la propiedad `sx`
- Modificar la altura en `height: '4px'`
- Ajustar las animaciones en las propiedades de `transition`
- Cambiar la posición modificando las propiedades `position` y `top/left/right`
