/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author koush
 */
public class Bubble_sort {

    /**
     * @param args the command line arguments
     */
    static int[] uno = {6,5,1,3,8,4,7,9,2};

    public static void main(String[] args) {
        // TODO code application logic here
        bubble_sort();
    }

    public static void bubble_sort() {
        int temp;

        for (int i = 0; i < uno.length; i++) {
            for (int j = 1; j < uno.length - i; j++) {

                if (uno[j - 1] >= uno[j]) {
                    temp = uno[j - 1];
                    uno[j - 1] = uno[j];
                    uno[j] = temp;
                }
            }
        }

        for (int i = 0; i < uno.length; i++) {
            System.out.print(uno[i] + ",");
        }
    }

}
