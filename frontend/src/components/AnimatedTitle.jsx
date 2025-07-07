import React from 'react';
import { Typography } from '@mui/material';
import PropTypes from 'prop-types';

function AnimatedTitle({
  variant = 'h3',
  component = 'h1',
  animationType = 'pulse',
  sx = {},
  ...props
}) {
  const getAnimationClass = () => {
    switch (animationType) {
      case 'gradient':
        return 'karting-title karting-title-pulse karting-title-energy';
      case 'glow':
        return 'karting-title karting-title-energy';
      case 'sweep':
        return 'karting-title-sweep';
      case 'neon':
        return 'karting-title-neon';
      case 'letters':
        return 'karting-title-letters';
      case 'pulse':
        return 'karting-title-pulse';
      case 'subtle-glow':
        return 'karting-title-subtle-glow';
      case 'gentle-pulse':
        return 'karting-title-gentle-pulse';
      case 'soft-breathe':
        return 'karting-title-soft-breathe';
      case 'minimal-wave':
        return 'karting-title-minimal-wave';
      case 'quiet-shimmer':
        return 'karting-title-quiet-shimmer';
      default:
        return 'karting-title-pulse';
    }
  };

  const renderContent = () => {
    const text = '🏎️ KartingRM';
    if (animationType === 'letters') {
      return text.split('').map((char, index) => (
        <span
          key={index}
          className="letter"
          style={{ animationDelay: `${index * 0.1}s` }}
        >
          {char}
        </span>
      ));
    }
    if (animationType === 'glow' || animationType === 'gradient') {
      return (
        <>
          <span className="title-base">{text}</span>
          <span className="title-wave">{text}</span>
        </>
      );
    }
    return text;
  };

  return (
    <div className="karting-title-container">
      <Typography
        variant={variant}
        component={component}
        className={getAnimationClass()}
        sx={{
          fontWeight: 900,
          fontSize: { xs: '2.5rem', md: '3.5rem' },
          marginBottom: 2,
          position: 'relative',
          zIndex: 2,
          ...sx,
        }}
        {...props}
      >
        {renderContent()}
      </Typography>
    </div>
  );
}

AnimatedTitle.propTypes = {
  variant: PropTypes.string,
  component: PropTypes.string,
  animationType: PropTypes.oneOf([
    'gradient', 'neon', 'letters', 'pulse', 'glow', 'sweep',
    'subtle-glow', 'gentle-pulse', 'soft-breathe', 'minimal-wave', 'quiet-shimmer',
  ]),
  sx: PropTypes.object,
};

export default AnimatedTitle;
