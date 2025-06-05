package com.example.math;

public class QuadraticEquationSolver {
    private double a, b, c;

    public QuadraticEquationSolver(double a, double b, double c) {
        if (a == 0) {
            throw new IllegalArgumentException("a phải khác 0 để là phương trình bậc 2.");
        }
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public double getDiscriminant() {
        return b * b - 4 * a * c;
    }

    public double[] solve() {
        double delta = getDiscriminant();

        if (delta < 0) {
            return new double[0];
        } else if (delta == 0) {
            return new double[]{-b / (2 * a)};
        } else {
            double sqrtDelta = Math.sqrt(delta);
            double x1 = (-b + sqrtDelta) / (2 * a);
            double x2 = (-b - sqrtDelta) / (2 * a);
            return new double[]{x1, x2};
        }
    }
}
