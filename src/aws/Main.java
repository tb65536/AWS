package aws;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class Main {

    // cache.get(Si).get(k) is a list of all column vectors G with <G,G> = 2k
    private static final Map<Matrix, List<List<Matrix>>> cache = new HashMap<>();

    public static void main(String[] args) {
        computeCache(); // takes about an hour on my laptop
    }

    private static void computeCache() {
        computeCache(Matrix.S1);
        computeCache(Matrix.S2);
        computeCache(Matrix.S3);
        System.out.println("Built cache: "
                + cache.get(Matrix.S1).get(1).size() + " "
                + cache.get(Matrix.S2).get(1).size() + " "
                + cache.get(Matrix.S3).get(1).size());
//        System.out.println("448 136 176"); // using 5 vectors
//        System.out.println("448 304 448"); // using 9 vectors
//        System.out.println("480 364 480"); // using 13 vectors
//        System.out.println("480 364 480"); // using 15 vectors (including 2+i and 3)
    }

    private static void computeCache(Matrix Si) {
        Complex[] a = {new Complex(0, 0), new Complex(1, 0), new Complex(-1, 0), new Complex(0, 1), new Complex(0, -1),
            new Complex(1, 1), new Complex(1, -1), new Complex(-1, 1), new Complex(-1, -1),
            new Complex(2, 0), new Complex(-2, 0), new Complex(0, 2), new Complex(0, -2)};
        cache.put(Si, new ArrayList<>());
        cache.get(Si).add(new ArrayList<>());
        cache.get(Si).get(0).add(new Matrix(8, 1, new Complex[][]{{a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}, {a[0]}}));
        cache.get(Si).add(new ArrayList<>());
        for (Complex z1 : a) {
            for (Complex z2 : a) {
                for (Complex z3 : a) {
                    for (Complex z4 : a) {
                        for (Complex z5 : a) {
                            for (Complex z6 : a) {
                                for (Complex z7 : a) {
                                    for (Complex z8 : a) {
                                        Matrix G = new Matrix(8, 1, new Complex[][]{{z1}, {z2}, {z3}, {z4}, {z5}, {z6}, {z7}, {z8}});
                                        Matrix Gt = G.conjugateTranspose();
                                        if (Gt.multiply(Si).multiply(G).val().val() == 2) {
                                            cache.get(Si).get(1).add(G);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
