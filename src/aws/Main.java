package aws;

public class Main {

    public static void main(String[] args) {
        System.out.println(Matrix.S1.equals(Matrix.S1.conjugateTranspose()));
        System.out.println(Matrix.S2.equals(Matrix.S2.conjugateTranspose()));
        System.out.println(Matrix.S3.equals(Matrix.S3.conjugateTranspose()));

        Complex[] a = {new Complex(0, 0), new Complex(1, 0), new Complex(-1, 0), new Complex(0, 1), new Complex(0, -1),
            new Complex(1, 1), new Complex(1, -1), new Complex(-1, 1), new Complex(-1, -1),
            new Complex(2, 0), new Complex(-2, 0), new Complex(0, 2), new Complex(0, -2)};
        long n1 = 0;
        long n2 = 0;
        long n3 = 0;
        for (Complex z1 : a) {
            for (Complex z2 : a) {
                for (Complex z3 : a) {
                    for (Complex z4 : a) {
                        for (Complex z5 : a) {
                            for (Complex z6 : a) {
                                for (Complex z7 : a) {
                                    for (Complex z8 : a) {
                                        Matrix M = new Matrix(8, 1, new Complex[][]{{z1}, {z2}, {z3}, {z4}, {z5}, {z6}, {z7}, {z8}});
                                        Matrix Mt = M.conjugateTranspose();
                                        long M1 = Mt.multiply(Matrix.S1).multiply(M).val().val();
                                        long M2 = Mt.multiply(Matrix.S2).multiply(M).val().val();
                                        long M3 = Mt.multiply(Matrix.S3).multiply(M).val().val();
                                        if (M1 == 2) {
                                            n1++;
                                        }
                                        if (M2 == 2) {
                                            n2++;
                                        }
                                        if (M3 == 2) {
                                            n3++;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        System.out.println(n1+" "+n2+" "+n3);
        System.out.println();
        System.out.println("448 136 176"); // using 5 vectors
        System.out.println("448 304 448"); // using 9 vectors
        System.out.println("480 364 480"); // using 13 vectors
        System.out.println("480 364 480"); // using 15 vectors (including 2+i and 3)
    }
}
