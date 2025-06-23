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

function GenericList({
  columns,
  data,
  service,
  loadItems,
  onAdd,
  onEdit,
  extraActions,
}) {
  const {
    confirmOpen,
    handleDeleteOpen,
    handleCancelDelete,
    handleConfirmDelete,
  } = useListOperations(service, loadItems);

  return (
    <TableContainer
      component={Paper}
      sx={{ backgroundColor: 'rgba(30, 30, 47, 0.9)' }}
    >
      <h3 style={{ color: 'var(--text-optional-color)', textAlign: 'center' }}>
        Lista
      </h3>
      <Button
        variant="contained"
        sx={{
          backgroundColor: 'var(--primary-color)',
          color: 'var(--text-color)',
          '&:hover': { backgroundColor: 'var(--hover-color)' },
        }}
        onClick={onAdd}
        style={{ margin: '1rem' }}
      >
        Añadir
      </Button>
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
      <ConfirmDialog
        open={confirmOpen}
        title="Confirmar Eliminación"
        message="¿Está seguro de que desea eliminar este elemento?"
        onCancel={handleCancelDelete}
        onConfirm={handleConfirmDelete}
      />
    </TableContainer>
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
    delete: PropTypes.func.isRequired,
  }).isRequired,
  loadItems: PropTypes.func.isRequired,
  onAdd: PropTypes.func.isRequired,
  onEdit: PropTypes.func.isRequired,
  extraActions: PropTypes.func,
};

GenericList.defaultProps = {
  extraActions: null,
};

export default GenericList;
