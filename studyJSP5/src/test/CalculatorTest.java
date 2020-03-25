package test;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculatorTest {

	@Test
	public void testSum() {
//		fail("Not yet implemented");
		double result = Calculator.sum(4, 5);
		assertTrue("The result 9.0", (result == 9));
	}

	@Test
	public void testSub() {
		double result = Calculator.sub(5, 4);
		assertTrue("The result 1.0", (result == 1.0));
	}

	@Test
	public void testMul() {
		fail("Not yet implemented");
	}

	@Test
	public void testDiv() {
		fail("Not yet implemented");
	}

}
