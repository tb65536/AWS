package aws;

public class Complex {

    private final long x;
    private final long y;

    public Complex(long x, long y) {
        this.x = x;
        this.y = y;
    }

    public Complex conjugate() {
        return new Complex(x, -y);
    }

    public Complex add(Complex z) {
        return new Complex(x + z.x, y + z.y);
    }

    public Complex multiply(Complex z) {
        return new Complex(x * z.x - y * z.y, x * z.y + y * z.x);
    }

    public long val() {
        if (y != 0) {
            throw new IllegalArgumentException();
        }
        return x;
    }

    @Override
    public String toString() {
        return "(" + x + "," + y + ")";
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (int) (this.x ^ (this.x >>> 32));
        hash = 97 * hash + (int) (this.y ^ (this.y >>> 32));
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
        final Complex other = (Complex) obj;
        if (this.x != other.x) {
            return false;
        }
        return this.y == other.y;
    }
}
