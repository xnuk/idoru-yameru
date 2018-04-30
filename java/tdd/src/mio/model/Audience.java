package mio.model;

public class Audience {
    private static final int STANDARD_COUNT = 100;
    private int count;

    private Audience(int count) {
        this.count = count;
    }

    public static Audience of(int count) {
        if (count <= 0) {
            throw new IllegalArgumentException("비정상적인 관객수");
        }

        return new Audience(count);
    }

    boolean checkCountOver100() {
        if (count >= STANDARD_COUNT) {
            return true;
        }

        return false;
    }
}
