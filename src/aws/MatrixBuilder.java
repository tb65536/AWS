package aws;

public class MatrixBuilder {

    private static final Complex _0 = new Complex(0, 0);
    private static final Complex _1 = new Complex(1, 0);
    private static final Complex _2 = new Complex(2, 0);
    private static final Complex _3 = new Complex(3, 0);
    private static final Complex _4 = new Complex(4, 0);
    private static final Complex _6 = new Complex(6, 0);
    private static final Complex m1 = new Complex(-1, 0);
    private static final Complex m3 = new Complex(-3, 0);
    private static final Complex m5 = new Complex(-15, 0);
    private static final Complex _I = new Complex(0, 1);
    private static final Complex mI = new Complex(0, -1);
    private static final Complex qq = new Complex(1, 1);
    private static final Complex qQ = new Complex(1, -1);
    private static final Complex Qq = new Complex(-1, 1);
    private static final Complex QQ = new Complex(-1, -1);
    private static final Complex rr = new Complex(2, 2);
    private static final Complex rR = new Complex(2, -2);
    private static final Complex Rr = new Complex(-2, 2);
    private static final Complex ss = new Complex(3, 3);
    private static final Complex sS = new Complex(3, -3);
    private static final Complex Ss = new Complex(-3, 3);
    private static final Complex SS = new Complex(-3, -3);
    private static final Complex tT = new Complex(12, -12);
    private static final Complex uU = new Complex(9, -15);

    public static Matrix I() {
        return new Matrix(8, 8, new Complex[][]{
            {_1, _0, _0, _0, _0, _0, _0, _0},
            {_0, _1, _0, _0, _0, _0, _0, _0},
            {_0, _0, _1, _0, _0, _0, _0, _0},
            {_0, _0, _0, _1, _0, _0, _0, _0},
            {_0, _0, _0, _0, _1, _0, _0, _0},
            {_0, _0, _0, _0, _0, _1, _0, _0},
            {_0, _0, _0, _0, _0, _0, _1, _0},
            {_0, _0, _0, _0, _0, _0, _0, _1}});
    }

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
            {_2, m1, _0, m1, m1, m1, mI, qq},
            {m1, _2, qQ, _0, _0, _0, _0, mI},
            {_0, qq, _2, _0, _0, _0, _0, _1},
            {m1, _0, _0, _2, _1, _1, _I, m1},
            {m1, _0, _0, _1, _2, _1, _I, m1},
            {m1, _0, _0, _1, _1, _2, _I, m1},
            {_I, _0, _0, mI, mI, mI, _2, _I},
            {qQ, _I, _1, m1, m1, m1, mI, _4}});
    }

    public static Matrix S3() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, _0, qq, _I, _0, _0, _0, _0},
            {_0, _2, _I, qQ, _0, _0, _0, _0},
            {qQ, mI, _2, _0, _0, _0, _0, _0},
            {mI, qq, _0, _2, _0, _0, _0, _0},
            {_0, _0, _0, _0, _2, _0, qq, _I},
            {_0, _0, _0, _0, _0, _2, _I, qQ},
            {_0, _0, _0, _0, qQ, mI, _2, _0},
            {_0, _0, _0, _0, mI, qq, _0, _2}});
    }

    public static Matrix D1() {
        return I();
    }

    public static Matrix D2() {
        return new Matrix(8, 8, new Complex[][]{
            {_3, _0, _0, _0, _0, _0, _0, _0},
            {_0, _1, _0, _0, _0, _0, _0, _0},
            {_0, _0, _1, _0, _0, _0, _0, _0},
            {_0, _0, _0, _3, _0, _0, _0, _0},
            {_0, _0, _0, _0, _3, _0, _0, _0},
            {_0, _0, _0, _0, _0, _3, _0, _0},
            {_0, _0, _0, _0, _0, _0, _3, _0},
            {_0, _0, _0, _0, _0, _0, _0, _3}});
    }

    public static Matrix D3() {
        return I();
    }

    public static Matrix L1() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, _0, _0, _0, _1, _1, _0, _1},
            {_0, _2, _0, _0, m1, _1, m1, _0},
            {_0, _0, _2, _0, _0, _1, _1, m1},
            {_0, _0, _0, _2, m1, _0, _1, _1},
            {_0, _0, _0, _0, _1, _0, _0, _0},
            {_0, _0, _0, _0, _0, _1, _0, _0},
            {_0, _0, _0, _0, _0, _0, _1, _0},
            {_0, _0, _0, _0, _0, _0, _0, _1}});
    }

    public static Matrix L2() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, m1, _0, m1, m1, m1, mI, qq},
            {_0, _3, rR, m1, m1, m1, mI, qQ},
            {_0, _0, _2, qq, qq, qq, Qq, _1},
            {_0, _0, _0, qq, _0, _0, _0, m1},
            {_0, _0, _0, _0, qq, _0, _0, m1},
            {_0, _0, _0, _0, _0, qq, _0, m1},
            {_0, _0, _0, _0, _0, _0, qQ, _1},
            {_0, _0, _0, _0, _0, _0, _0, _1}});
    }

    public static Matrix L3() {
        return new Matrix(8, 8, new Complex[][]{
            {_2, _0, qq, _I, _0, _0, _0, _0},
            {_0, _2, _I, qQ, _0, _0, _0, _0},
            {_0, _0, _1, _0, _0, _0, _0, _0},
            {_0, _0, _0, _1, _0, _0, _0, _0},
            {_0, _0, _0, _0, _2, _0, qq, _I},
            {_0, _0, _0, _0, _0, _2, _I, qQ},
            {_0, _0, _0, _0, _0, _0, _1, _0},
            {_0, _0, _0, _0, _0, _0, _0, _1}});
    }

    public static Matrix Li1() {
        return new Matrix(8, 8, new Complex[][]{
            {_1, _0, _0, _0, m1, m1, _0, m1},
            {_0, _1, _0, _0, _1, m1, _1, _0},
            {_0, _0, _1, _0, _0, m1, m1, _1},
            {_0, _0, _0, _1, _1, _0, m1, m1},
            {_0, _0, _0, _0, _2, _0, _0, _0},
            {_0, _0, _0, _0, _0, _2, _0, _0},
            {_0, _0, _0, _0, _0, _0, _2, _0},
            {_0, _0, _0, _0, _0, _0, _0, _2}});
    }

    public static Matrix Li2() {
        return new Matrix(8, 8, new Complex[][]{
            {_3, _1, Qq, sS, sS, sS, Ss, uU},
            {_0, _2, Rr, sS, sS, sS, Ss, tT},
            {_0, _0, _3, m3, m3, m3, _3, m5},
            {_0, _0, _0, sS, _0, _0, _0, sS},
            {_0, _0, _0, _0, sS, _0, _0, sS},
            {_0, _0, _0, _0, _0, sS, _0, sS},
            {_0, _0, _0, _0, _0, _0, ss, SS},
            {_0, _0, _0, _0, _0, _0, _0, _6}});
    }

    public static Matrix Li3() {
        return new Matrix(8, 8, new Complex[][]{
            {_1, _0, QQ, mI, _0, _0, _0, _0},
            {_0, _1, mI, Qq, _0, _0, _0, _0},
            {_0, _0, _2, _0, _0, _0, _0, _0},
            {_0, _0, _0, _2, _0, _0, _0, _0},
            {_0, _0, _0, _0, _1, _0, QQ, mI},
            {_0, _0, _0, _0, _0, _1, mI, Qq},
            {_0, _0, _0, _0, _0, _0, _2, _0},
            {_0, _0, _0, _0, _0, _0, _0, _2}});
    }
}
