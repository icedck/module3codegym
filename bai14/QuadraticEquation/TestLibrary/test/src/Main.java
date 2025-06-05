import com.example.math.QuadraticEquationSolver;

public class Main {
    public static void main(String[] args) {
        QuadraticEquationSolver solver = new QuadraticEquationSolver(1, -3, 2);
        double[] roots = solver.solve();

        if (roots.length == 0) {
            System.out.println("Phương trình vô nghiệm thực.");
        } else {
            System.out.println("Nghiệm của phương trình:");
            for (double r : roots) {
                System.out.println("x = " + r);
            }
        }
    }
}
