
package javaapplication;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class maxnewpath {
	public static void main (String[] args) throws IOException {
		String s;
		try {
		Process p = Runtime.getRuntime().exec(
		"/usr/bin/open file:///Users/melaniemoeller/Documents/InteractiveSystem/processingfile/processingfile.pde");
		BufferedReader err = new BufferedReader (
		new InputStreamReader (p.getErrorStream()));
		while ((s = err.readLine()) != null) {
		System.out.println(s);
		}
		}
		catch (Exception e) {
			e.printStackTrace();
			}
	}
}
