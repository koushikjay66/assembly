/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author koush
 */
public class Insertion_Sort {

    /**
     * @param args the command line arguments
     */
    static int[] uno = {6, 5, 1, 3, 8, 4, 7, 9, 2};

    public static void main(String[] args) {
        // TODO code application logic here
        Insertion_Sort();
        for (int i = 0; i < uno.length; i++) {
            System.out.print(uno[i] + ",");
        }
    }

    public static void Insertion_Sort() {
        int temp = 0;
        for (int i = 1; i < uno.length; i++) {
            while (i > 0 && uno[i - 1] > uno[i]) {
                temp = uno[i - 1];
                uno[i - 1] = uno[i];
                uno[i] = temp;
                i--;
            }
        }
    }

}
