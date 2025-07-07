import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import App from '../App';

describe('App Component', () => {
  it('should render without crashing', () => {
    render(<App />);
    expect(document.body).toBeInTheDocument();
  });
});
