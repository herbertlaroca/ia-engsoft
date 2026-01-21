import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

class SnakeLogicTest {
    private ThreadsController controller;

    @BeforeEach
    void setup() {
        Tuple initialPos = new Tuple(10, 10);
        controller = new ThreadsController(initialPos);
    }

    // Helper para acessar campos privados
    private Object getPrivateField(Object obj, String fieldName) throws Exception {
        Field field = obj.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(obj);
    }

    @Test
    void testSnakeMovementRight() throws Exception {
        // Acessa o método privado moveInterne
        Method moveMethod = ThreadsController.class.getDeclaredMethod("moveInterne", int.class);
        moveMethod.setAccessible(true);
        
        controller.directionSnake = 1; // Direita
        moveMethod.invoke(controller, 1);
        
        // Acessa a lista privada snakePos
        ArrayList<Tuple> snakePos = (ArrayList<Tuple>) getPrivateField(controller, "snakePos");
        Tuple head = snakePos.get(snakePos.size() - 1);
        
        assertEquals(11, head.x, "A cabeça deveria estar em X=11");
    }

    @Test
    void testEatingFoodCheck() throws Exception {
        // Testando a lógica de colisão com a comida
        ArrayList<Tuple> snakePos = (ArrayList<Tuple>) getPrivateField(controller, "snakePos");
        int initialSize = snakePos.size();
        
        // Coloca a comida exatamente onde a cobra vai estar
        controller.foodPosition = new Tuple(11, 10);
        
        Method moveMethod = ThreadsController.class.getDeclaredMethod("moveInterne", int.class);
        moveMethod.setAccessible(true);
        moveMethod.invoke(controller, 1); // Move para a direita (11, 10)
        
        assertEquals(initialSize + 1, snakePos.size(), "A cobra deveria crescer ao comer");
    }
}