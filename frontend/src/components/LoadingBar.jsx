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
  const [progress, setProgress] = useState(0);

  // Función para iniciar la carga
  const startLoading = () => {
    setLoadingCount(prev => {
      const newCount = prev + 1;
      if (newCount === 1) {
        setIsLoading(true);
        setProgress(0);
      }
      return newCount;
    });
  };

  // Función para terminar la carga
  const stopLoading = () => {
    setLoadingCount(prev => {
      const newCount = Math.max(0, prev - 1);
      if (newCount === 0) {
        // Completar la barra al 100% antes de ocultarla
        setProgress(100);
        setTimeout(() => {
          setIsLoading(false);
          setProgress(0);
        }, 300);
      }
      return newCount;
    });
  };

  // Simular progreso mientras está cargando
  useEffect(() => {
    let timer;
    if (isLoading && progress < 90) {
      timer = setInterval(() => {
        setProgress(prev => {
          if (prev >= 90) return prev;
          // Progreso más rápido al inicio, luego más lento
          const increment = Math.random() * 15 * (1 - prev / 100);
          return Math.min(prev + increment, 90);
        });
      }, 150);
    }
    return () => clearInterval(timer);
  }, [isLoading, progress]);

  const value = {
    isLoading,
    progress,
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
  const { isLoading, progress } = useLoading();

  if (!isLoading) {
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
            background: 'linear-gradient(90deg, var(--primary-color), var(--accent-color))',
            transition: 'transform 0.2s ease-out',
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
    } finally {
      stopLoading();
    }
  };

  return { executeWithLoading };
};
