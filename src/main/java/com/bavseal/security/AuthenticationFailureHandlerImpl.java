package com.bavseal.security;

import com.bavseal.dto.UsuarioDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class AuthenticationFailureHandlerImpl implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        
        String error = exception.getMessage();        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UsuarioDTO usuarioDto = new UsuarioDTO();
        usuarioDto.setUsername(username);
        usuarioDto.setPassword(password);
        request.setAttribute("usuarioDto", usuarioDto);
        
        String url = request.getContextPath() + "/login?" + error;
        response.sendRedirect(url);        
    }

}
