import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

function KeyboardShortcuts() {
  const navigate = useNavigate();

  useEffect(() => {
    const handleKeyDown = (event) => {
      // Solo actuar si se presiona Ctrl
      if (!event.ctrlKey) return;

      // Prevenir el comportamiento por defecto del navegador
      event.preventDefault();

      switch (event.key.toLowerCase()) {
        case 'h':
          navigate('/home');
          break;
        case 'r':
          navigate('/reserve/list');
          break;
        case 'u':
          navigate('/user/list');
          break;
        case 't':
          navigate('/tariff/list');
          break;
        case 'g':
          navigate('/reports/generate');
          break;
        case 'k':
          navigate('/rack/semana');
          break;
        case 'f':
          navigate('/faq');
          break;
        default:
          // No hacer nada para otras teclas
          break;
      }
    };

    // Agregar el event listener
    document.addEventListener('keydown', handleKeyDown);

    // Cleanup: remover el event listener cuando el componente se desmonte
    return () => {
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, [navigate]);

  // Este componente no renderiza nada
  return null;
}

export default KeyboardShortcuts;
