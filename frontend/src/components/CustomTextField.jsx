import TextField from '@mui/material/TextField';
import PropTypes from 'prop-types';

function CustomTextField({
  label,
  value,
  onChange,
  type = 'text',
  helperText,
  ...props
}) {
  return (
    <TextField
      label={label}
      value={value}
      onChange={onChange}
      type={type}
      helperText={helperText}
      variant="outlined"
      fullWidth
      margin="normal"
      sx={{
        '& .MuiOutlinedInput-root': {
          color: 'var(--text-color)',
          '& fieldset': {
            borderColor: 'var(--border-color)',
          },
          '&:hover fieldset': {
            borderColor: 'var(--accent-color)',
          },
          '&.Mui-focused fieldset': {
            borderColor: 'var(--secondary-color)',
            borderWidth: '2px',
          },
          '&.Mui-focused': {
            backgroundColor: 'rgba(160, 76, 255, 0.2)',
          },
        },
        '& .MuiFormLabel-root': {
          color: 'var(--text-color)',
        },
      }}
      // eslint-disable-next-line react/jsx-props-no-spreading
      {...props}
    />
  );
}

CustomTextField.propTypes = {
  label: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
  onChange: PropTypes.func.isRequired,
  type: PropTypes.string,
  helperText: PropTypes.string,
};

CustomTextField.defaultProps = {
  type: 'text',
  helperText: '',
};

export default CustomTextField;
