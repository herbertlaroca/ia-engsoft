import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.awt.Color;

class DataOfSquareTest {

    @Test
    void testColorChange() {
        DataOfSquare square = new DataOfSquare(1); // 1 = Comida (Azul no original)
        assertEquals(1, square.color, "Deveria iniciar com a cor 1");
        
        square.lightMeUp(2); // 2 = Cobra (Branco)
        assertEquals(2, square.color, "A cor deveria mudar para 2");
    }
}