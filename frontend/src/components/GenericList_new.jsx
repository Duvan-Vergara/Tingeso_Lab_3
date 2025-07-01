import PropTypes from 'prop-types';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import Button from '@mui/material/Button';
import ConfirmDialog from './ConfirmDialog';
import useListOperations from './useListOperations';
import { useAsyncLoading } from './LoadingBar';
import CardLayout from './CardLayout';
import EmptyState from './EmptyState';

function GenericList({
  columns,
  data,
  service,
  loadItems,
  onAdd,
  onEdit,
  extraActions,
  confirmText,
  cancelText,
  confirmTitle,
  confirmMessage,
}) {
  const { executeWithLoading } = useAsyncLoading(); // eslint-disable-line no-unused-vars
  const {
    confirmOpen,
    handleDeleteOpen,
    handleCancelDelete,
    handleConfirmDelete,
  } = useListOperations(service, loadItems);

  return (
    <CardLayout title="Lista" className="table-container">
      <Button
        variant="contained"
        className="list-add-button"
        onClick={onAdd}
      >
        Añadir
      </Button>
      
      {data.length === 0 ? (
        <EmptyState
          title="No hay elementos"
          description="No se encontraron elementos para mostrar."
          icon="📋"
          action={
            <button onClick={onAdd} className="btn-primary">
              Agregar primer elemento
            </button>
          }
        />
      ) : (
        <TableContainer
          component={Paper}
          sx={{
            backgroundColor: 'transparent',
            boxShadow: 'none',
            border: 'none',
          }}
        >
          <Table>
            <TableHead>
              <TableRow>
                {columns.map((col) => (
                  <TableCell
                    key={col.field}
                    align={col.align || 'left'}
                    sx={{ fontWeight: 'bold', color: 'var(--text-color)' }}
                  >
                    {col.headerName}
                  </TableCell>
                ))}
                <TableCell
                  align="center"
                  sx={{ fontWeight: 'bold', color: 'var(--text-color)' }}
                >
                  Operaciones
                </TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {data.map((item) => (
                <TableRow key={item.id}>
                  {columns.map((col) => (
                    <TableCell
                      key={col.field}
                      align={col.align || 'left'}
                      sx={{ color: 'var(--text-color)' }}
                    >
                      {col.render ? col.render(item[col.field], item) : item[col.field]}
                    </TableCell>
                  ))}
                  <TableCell align="center">
                    <Button
                      variant="contained"
                      sx={{
                        backgroundColor: 'var(--primary-color)',
                        color: 'var(--text-color)',
                        '&:hover': { backgroundColor: 'var(--hover-color)' },
                      }}
                      size="small"
                      onClick={() => onEdit(item.id)}
                    >
                      Editar
                    </Button>
                    <Button
                      variant="contained"
                      sx={{
                        backgroundColor: 'var(--secondary-color)',
                        color: 'var(--text-color)',
                        '&:hover': { backgroundColor: 'var(--hover-color)' },
                      }}
                      size="small"
                      onClick={() => handleDeleteOpen(item.id)}
                      style={{ marginLeft: '0.5rem' }}
                    >
                      Eliminar
                    </Button>
                    {extraActions && extraActions(item)}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
      )}
      
      <ConfirmDialog
        open={confirmOpen}
        title={confirmTitle}
        message={confirmMessage}
        confirmText={confirmText}
        cancelText={cancelText}
        onCancel={handleCancelDelete}
        onConfirm={handleConfirmDelete}
      />
    </CardLayout>
  );
}

GenericList.propTypes = {
  columns: PropTypes.arrayOf(
    PropTypes.shape({
      field: PropTypes.string.isRequired,
      headerName: PropTypes.string.isRequired,
      align: PropTypes.string,
      render: PropTypes.func,
    }),
  ).isRequired,
  data: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.oneOfType([PropTypes.string, PropTypes.number]).isRequired,
    }),
  ).isRequired,
  service: PropTypes.shape({
    delete: PropTypes.func,
    deleteById: PropTypes.func,
  }).isRequired,
  loadItems: PropTypes.func.isRequired,
  onAdd: PropTypes.func.isRequired,
  onEdit: PropTypes.func.isRequired,
  extraActions: PropTypes.func,
  confirmText: PropTypes.string,
  cancelText: PropTypes.string,
  confirmTitle: PropTypes.string,
  confirmMessage: PropTypes.string,
};

GenericList.defaultProps = {
  extraActions: null,
  confirmText: 'Confirmar',
  cancelText: 'Cancelar',
  confirmTitle: 'Confirmar Eliminación',
  confirmMessage: '¿Está seguro de que desea eliminar este elemento?',
};

export default GenericList;
