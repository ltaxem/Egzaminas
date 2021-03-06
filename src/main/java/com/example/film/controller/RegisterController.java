package com.example.film.controller;

import com.example.film.MainApplication;
import com.example.film.model.User;
import com.example.film.model.UserDao;
import com.example.film.utils.BCryptPassword;
import com.example.film.utils.Validation;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;

import java.io.IOException;

public class RegisterController {

    @FXML
    private TextField reUsername, reEmail;

    @FXML
    private PasswordField rePassword, reConfirmPassword;

    @FXML
    private CheckBox isAdminCheckBox;

    @FXML
    private Label reLoginStatus;


    @FXML
    public void reOnRegisterButtonClick(ActionEvent event) throws IOException {
        String reUsername2 = reUsername.getText();
        String rePassword2 = rePassword.getText();
        String reConfirmPassword2 = reConfirmPassword.getText();
        String reEmail2 = reEmail.getText();

        if (Validation.isValidUsername(reUsername2) &&
                Validation.chechUsernameDublication(reUsername2) &&
                Validation.chechEmailDublication(reEmail2) &&
                Validation.isValidPassword(rePassword2) &&
                Validation.isValidPassword(reConfirmPassword2) &&
                rePassword2.equals(reConfirmPassword2) &&
                Validation.isValidEmail(reEmail2)) {
            reLoginStatus.setText("Duomenys įvesti teisingai");

            String passwordBCrypt = BCryptPassword.hashPassword(rePassword2);

            boolean isAdmin = isAdminCheckBox.isSelected();
            User user = new User(reUsername2, passwordBCrypt, reEmail2, isAdmin);
            UserDao.create(user);

            goToLogin(event);
        }
        if (!Validation.isValidEmail(reEmail2)) reLoginStatus.setText("Blogai įvestas el. pašto adresas");
        if (!Validation.chechEmailDublication(reEmail2)) reLoginStatus.setText("Toks el. paštas jau užimtas");
        if (!rePassword2.equals(reConfirmPassword2)) reLoginStatus.setText("Slaptažodžiai nesutampa");
        if (!Validation.isValidPassword(reConfirmPassword2)) reLoginStatus.setText("Blogai įvestas patvirtinimo slaptažodis");
        if (!Validation.isValidPassword(rePassword2)) reLoginStatus.setText("Blogai įvestas slaptažodis");
        if (!Validation.isValidUsername(reUsername2)) reLoginStatus.setText("Blogai įvestas vartotojo vardas");
        if (!Validation.chechUsernameDublication(reUsername2)) reLoginStatus.setText("Toks prisijungimo vardas jau užimtas");
    }

    @FXML
    public void onReturnButtonClick(ActionEvent event) throws IOException {
        goToLogin(event);
    }

    @FXML
    public void goToLogin(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(MainApplication.class.getResource("login-view.fxml"));
        Stage LoginStage = new Stage();
        LoginStage.setTitle("Prisijungimo langas");
        LoginStage.setScene(new Scene(root, 1185, 660));
        LoginStage.show();
        ((Node) event.getSource()).getScene().getWindow().hide();
    }
}
