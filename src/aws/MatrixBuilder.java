package aws;

public class MatrixBuilder {

    private static final Complex _0 = new Complex(0, 0);
    private static final Complex _1 = new Complex(1, 0);
    private static final Complex _2 = new Complex(2, 0);
    private static final Complex _4 = new Complex(4, 0);
    private static final Complex m1 = new Complex(-1, 0);
    private static final Complex _I = new Complex(0, 1);
    private static final Complex mI = new Complex(0, -1);
    private static final Complex _q = new Complex(1, 1);
    private static final Complex mq = new Complex(1, -1);

    public static Matrix S1() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, _0, _0, _0, _1, _1, _0, _1},
            {_0, _2, _0, _0, m1, _1, m1, _0},
            {_0, _0, _2, _0, _0, _1, _1, m1},
            {_0, _0, _0, _2, m1, _0, _1, _1},
            {_1, m1, _0, m1, _2, _0, _0, _0},
            {_1, _1, _1, _0, _0, _2, _0, _0},
            {_0, m1, _1, _1, _0, _0, _2, _0},
            {_1, _0, m1, _1, _0, _0, _0, _2}});
    }

    public static Matrix S2() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, m1, _0, m1, m1, m1, mI, _q},
            {m1, _2, mq, _0, _0, _0, _0, mI},
            {_0, _q, _2, _0, _0, _0, _0, _1},
            {m1, _0, _0, _2, _1, _1, _I, m1},
            {m1, _0, _0, _1, _2, _1, _I, m1},
            {m1, _0, _0, _1, _1, _2, _I, m1},
            {_I, _0, _0, mI, mI, mI, _2, _I},
            {mq, _I, _1, m1, m1, m1, mI, _4}});
    }

    public static Matrix S3() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, _0, _q, _I, _0, _0, _0, _0},
            {_0, _2, _I, mq, _0, _0, _0, _0},
            {mq, mI, _2, _0, _0, _0, _0, _0},
            {mI, _q, _0, _2, _0, _0, _0, _0},
            {_0, _0, _0, _0, _2, _0, _q, _I},
            {_0, _0, _0, _0, _0, _2, _I, mq},
            {_0, _0, _0, _0, mq, mI, _2, _0},
            {_0, _0, _0, _0, mI, _q, _0, _2}});
    }
}
