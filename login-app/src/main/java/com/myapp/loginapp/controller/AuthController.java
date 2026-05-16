package com.myapp.loginapp.controller;

import com.myapp.loginapp.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    // ── Home ──────────────────────────────────────────────────────────────────
    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    // ── Login ─────────────────────────────────────────────────────────────────
    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "error",  required = false) String error,
                            @RequestParam(value = "logout", required = false) String logout,
                            Model model) {
        if (error  != null) model.addAttribute("errorMsg",  "Invalid username or password.");
        if (logout != null) model.addAttribute("logoutMsg", "You have been logged out.");
        return "login";
    }

    // ── Register – GET ────────────────────────────────────────────────────────
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // ── Register – POST ───────────────────────────────────────────────────────
    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String email,
                           @RequestParam String password,
                           @RequestParam String confirmPassword,
                           RedirectAttributes ra) {
        if (!password.equals(confirmPassword)) {
            ra.addFlashAttribute("errorMsg", "Passwords do not match.");
            return "redirect:/register";
        }
        try {
            userService.registerUser(username, email, password);
            ra.addFlashAttribute("successMsg", "Account created! Please log in.");
            return "redirect:/login";
        } catch (IllegalArgumentException ex) {
            ra.addFlashAttribute("errorMsg", ex.getMessage());
            return "redirect:/register";
        }
    }

    // ── Dashboard (protected) ─────────────────────────────────────────────────
    @GetMapping("/dashboard")
    public String dashboard(Authentication auth, Model model) {
        model.addAttribute("username", auth.getName());
        return "dashboard";
    }
}
