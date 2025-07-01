import PropTypes from 'prop-types';

function LoadingState({
  title = '',
  message = '',
  size = 'medium',
  showCard = true,
}) {
  const getSizeClass = () => {
    switch (size) {
    case 'small': return 'small';
    case 'large': return 'large';
    default: return '';
    }
  };

  const content = (
    <div className="loading-container">
      <div className={`loading-spinner ${getSizeClass()}`}></div>
      {title && <h3>{title}</h3>}
      {message && <p>{message}</p>}
    </div>
  );

  if (showCard) {
    return (
      <div className="card animate-fade-in">
        {content}
      </div>
    );
  }

  return content;
}

LoadingState.propTypes = {
  title: PropTypes.string,
  message: PropTypes.string,
  size: PropTypes.oneOf(['small', 'medium', 'large']),
  showCard: PropTypes.bool,
};

export default LoadingState;
