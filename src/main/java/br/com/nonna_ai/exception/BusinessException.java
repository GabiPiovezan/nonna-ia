package br.com.nonna_ai.exception;
public class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }
}
