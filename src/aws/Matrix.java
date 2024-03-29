package aws;

import java.util.Arrays;

public class Matrix {

    public static final Matrix I = MatrixBuilder.I();
    public static final Matrix S1 = MatrixBuilder.S1();
    public static final Matrix S2 = MatrixBuilder.S2();
    public static final Matrix S3 = MatrixBuilder.S3();
    public static final Matrix D1 = MatrixBuilder.D1();
    public static final Matrix D2 = MatrixBuilder.D2();
    public static final Matrix D3 = MatrixBuilder.D3();
    public static final Matrix L1 = MatrixBuilder.L1();
    public static final Matrix L2 = MatrixBuilder.L2();
    public static final Matrix L3 = MatrixBuilder.L3();
    public static final Matrix Li1 = MatrixBuilder.Li1();
    public static final Matrix Li2 = MatrixBuilder.Li2();
    public static final Matrix Li3 = MatrixBuilder.Li3();

    private final int m; // rows
    private final int n; // columns
    private final Complex[][] a;

    public Matrix(int m, int n, Complex[][] a) {
        this.m = m;
        this.n = n;
        this.a = new Complex[m][n];
        if (a.length != m) {
            throw new IllegalArgumentException();
        }
        for (int i = 0; i < m; i++) {
            if (a[i].length != n) {
                throw new IllegalArgumentException();
            }
            System.arraycopy(a[i], 0, this.a[i], 0, n);
        }
    }

    public Matrix(int m, int n) {
        this.m = m;
        this.n = n;
        a = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            Arrays.fill(a[i], Complex.ZERO);
        }
    }

    public Matrix conjugateTranspose() {
        Complex[][] b = new Complex[n][m];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[j][i] = a[i][j].conjugate();
            }
        }
        return new Matrix(n, m, b);
    }

    public Matrix add(Matrix M) {
        if (m != M.m || n != M.n) {
            throw new IllegalArgumentException();
        }
        Complex[][] b = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[i][j] = a[i][j].add(M.a[i][j]);
            }
        }
        return new Matrix(m, n, b);
    }

    public Matrix subtract(Matrix M) {
        if (m != M.m || n != M.n) {
            throw new IllegalArgumentException();
        }
        Complex[][] b = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[i][j] = a[i][j].subtract(M.a[i][j]);
            }
        }
        return new Matrix(m, n, b);
    }

    public Matrix multiply(Matrix M) {
        if (n != M.m) {
            throw new IllegalArgumentException();
        }
        Complex[][] b = new Complex[m][M.n];
        for (int i = 0; i < m; i++) {
            for (int k = 0; k < M.n; k++) {
                b[i][k] = new Complex(0, 0);
                for (int j = 0; j < n; j++) {
                    b[i][k] = b[i][k].add(a[i][j].multiply(M.a[j][k]));
                }
            }
        }
        return new Matrix(m, M.n, b);
    }

    public Matrix multiply(long c) {
        Complex[][] b = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[i][j] = a[i][j].multiply(c);
            }
        }
        return new Matrix(m, n, b);
    }

    public Matrix divide(long c) {
        Complex[][] b = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[i][j] = a[i][j].divide(c);
            }
        }
        return new Matrix(m, n, b);
    }

    public Matrix mod(long c) {
        Complex[][] b = new Complex[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                b[i][j] = a[i][j].mod(c);
            }
        }
        return new Matrix(m, n, b);
    }

    public Complex val() {
        if (m != 1 || n != 1) {
            throw new IllegalArgumentException();
        }
        return a[0][0];
    }

    public int rows() {
        return m;
    }

    public int columns() {
        return n;
    }

    public Complex get(int i, int j) {
        return a[i][j];
    }

    public Complex trace() {
        if (m != n) {
            throw new IllegalArgumentException();
        }
        Complex z = Complex.ZERO;
        for (int i = 0; i < m; i++) {
            z = z.add(a[i][i]);
        }
        return z;
    }

    @Override
    public String toString() {
        return Arrays.deepToString(a);
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 83 * hash + Arrays.deepHashCode(this.a);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Matrix other = (Matrix) obj;
        return Arrays.deepEquals(this.a, other.a);
    }
}
