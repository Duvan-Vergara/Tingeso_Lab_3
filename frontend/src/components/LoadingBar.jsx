import React, { createContext, useContext, useState, useEffect } from 'react';
import { LinearProgress, Box } from '@mui/material';
import PropTypes from 'prop-types';

// Contexto para manejar el estado de carga global
const LoadingContext = createContext();

// Hook personalizado para usar el contexto de carga
export const useLoading = () => {
  const context = useContext(LoadingContext);
  if (!context) {
    throw new Error('useLoading debe ser usado dentro de un LoadingProvider');
  }
  return context;
};

// Proveedor del contexto de carga
export const LoadingProvider = ({ children }) => {
  const [isLoading, setIsLoading] = useState(false);
  const [loadingCount, setLoadingCount] = useState(0);

  // Función para iniciar la carga
  const startLoading = () => {
    setLoadingCount(prev => prev + 1);
    setIsLoading(true);
  };

  // Función para terminar la carga
  const stopLoading = () => {
    setLoadingCount(prev => {
      const newCount = Math.max(0, prev - 1);
      if (newCount === 0) {
        // Agregar un pequeño delay para que la barra sea visible aunque sea muy rápido
        setTimeout(() => setIsLoading(false), 300);
      }
      return newCount;
    });
  };

  const value = {
    isLoading,
    startLoading,
    stopLoading,
  };

  return (
    <LoadingContext.Provider value={value}>
      {children}
    </LoadingContext.Provider>
  );
};

LoadingProvider.propTypes = {
  children: PropTypes.node.isRequired,
};

// Componente de la barra de carga
export const LoadingBar = () => {
  const { isLoading } = useLoading();
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    if (isLoading) {
      setProgress(0);
      const timer = setInterval(() => {
        setProgress((oldProgress) => {
          if (oldProgress === 100) {
            return 100;
          }
          // Progreso más rápido al inicio, luego más lento
          const diff = Math.random() * 10;
          return Math.min(oldProgress + diff, 95);
        });
      }, 100);

      return () => {
        clearInterval(timer);
      };
    } else {
      // Completar la barra rápidamente cuando termina la carga
      setProgress(100);
      const timer = setTimeout(() => {
        setProgress(0);
      }, 500);
      return () => clearTimeout(timer);
    }
  }, [isLoading]);

  if (!isLoading && progress === 0) {
    return null;
  }

  return (
    <Box
      sx={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        zIndex: 9999,
        height: '4px',
      }}
    >
      <LinearProgress
        variant="determinate"
        value={progress}
        sx={{
          height: '4px',
          backgroundColor: 'rgba(0, 0, 0, 0.1)',
          '& .MuiLinearProgress-bar': {
            backgroundColor: '#1976d2',
            transition: progress === 100 ? 'transform 0.3s ease-out' : 'transform 0.1s ease-out',
          },
        }}
      />
    </Box>
  );
};

// Hook personalizado para manejar cargas asíncronas
export const useAsyncLoading = () => {
  const { startLoading, stopLoading } = useLoading();

  const executeWithLoading = async (asyncFunction) => {
    startLoading();
    try {
      const result = await asyncFunction();
      return result;
    } catch (error) {
      throw error;
    } finally {
      stopLoading();
    }
  };

  return { executeWithLoading };
};
