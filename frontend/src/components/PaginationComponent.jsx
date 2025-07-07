import { useState } from 'react';
import PropTypes from 'prop-types';
import './PaginationComponent.css';

function PaginationComponent({
  currentPage,
  totalPages,
  totalElements,
  pageSize,
  onPageChange,
  onPageSizeChange,
}) {
  const [inputPage, setInputPage] = useState(currentPage + 1);

  const getPageNumbers = () => {
    const delta = 3;
    const range = [];
    const rangeWithDots = [];

    for (let i = Math.max(0, currentPage - delta);
      i <= Math.min(totalPages - 1, currentPage + delta);
      i++) {
      range.push(i);
    }

    if (range[0] > 0) {
      if (range[0] > 1) {
        rangeWithDots.push(0, '...');
      } else {
        rangeWithDots.push(0);
      }
    }

    rangeWithDots.push(...range);

    if (range[range.length - 1] < totalPages - 1) {
      if (range[range.length - 1] < totalPages - 2) {
        rangeWithDots.push('...', totalPages - 1);
      } else {
        rangeWithDots.push(totalPages - 1);
      }
    }

    return rangeWithDots;
  };

  const handlePageInput = (e) => {
    if (e.key === 'Enter') {
      const page = Math.max(1, Math.min(totalPages, parseInt(inputPage, 10) || 1));
      onPageChange(page - 1);
      setInputPage(page);
    }
  };

  const handlePageSizeChange = (e) => {
    const newSize = parseInt(e.target.value, 10);
    onPageSizeChange(newSize);
  };

  if (totalPages <= 1) return null;

  return (
    <nav className="pagination-container" role="navigation" aria-label="Paginación de reservas">
      <div className="pagination-info" role="status" aria-live="polite">
        <span>
          Mostrando {currentPage * pageSize + 1}-{Math.min((currentPage + 1) * pageSize, totalElements)} de {totalElements} reservas
        </span>
      </div>

      <div className="pagination-controls">
        <button
          className="pagination-btn"
          onClick={() => onPageChange(0)}
          disabled={currentPage === 0}
          title="Primera página"
          aria-label="Ir a la primera página"
        >
          ⟪
        </button>

        <button
          className="pagination-btn"
          onClick={() => onPageChange(currentPage - 1)}
          disabled={currentPage === 0}
          title="Página anterior"
          aria-label="Ir a la página anterior"
        >
          ‹
        </button>

        {getPageNumbers().map((pageNum, index) => (
          pageNum === '...' ? (
            <span key={`dots-${index}`} className="pagination-dots" aria-hidden="true">...</span>
          ) : (
            <button
              key={pageNum}
              className={`pagination-btn ${currentPage === pageNum ? 'active' : ''}`}
              onClick={() => onPageChange(pageNum)}
              aria-label={`Ir a la página ${pageNum + 1}`}
              aria-current={currentPage === pageNum ? 'page' : undefined}
            >
              {pageNum + 1}
            </button>
          )
        ))}

        <button
          className="pagination-btn"
          onClick={() => onPageChange(currentPage + 1)}
          disabled={currentPage === totalPages - 1}
          title="Página siguiente"
          aria-label="Ir a la página siguiente"
        >
          ›
        </button>

        <button
          className="pagination-btn"
          onClick={() => onPageChange(totalPages - 1)}
          disabled={currentPage === totalPages - 1}
          title="Última página"
          aria-label="Ir a la última página"
        >
          ⟫
        </button>

        <div className="page-jump">
          <label htmlFor="page-input" className="sr-only">Ir a página específica</label>
          <span>Ir a:</span>
          <input
            id="page-input"
            type="number"
            min="1"
            max={totalPages}
            value={inputPage}
            onChange={(e) => setInputPage(e.target.value)}
            onKeyDown={handlePageInput}
            className="page-input"
            aria-label="Número de página"
          />
        </div>

        <div className="page-size-selector">
          <label htmlFor="page-size-select" className="sr-only">Elementos por página</label>
          <span>Por página:</span>
          <select
            id="page-size-select"
            value={pageSize}
            onChange={handlePageSizeChange}
            className="page-size-select"
            aria-label="Elementos por página"
          >
            <option value={5}>5</option>
            <option value={10}>10</option>
            <option value={20}>20</option>
            <option value={50}>50</option>
            <option value={100}>100</option>
          </select>
        </div>
      </div>
    </nav>
  );
}

PaginationComponent.propTypes = {
  currentPage: PropTypes.number.isRequired,
  totalPages: PropTypes.number.isRequired,
  totalElements: PropTypes.number.isRequired,
  pageSize: PropTypes.number.isRequired,
  onPageChange: PropTypes.func.isRequired,
  onPageSizeChange: PropTypes.func.isRequired,
};

PaginationComponent.defaultProps = {
  currentPage: 0,
  pageSize: 10,
};

export default PaginationComponent;
