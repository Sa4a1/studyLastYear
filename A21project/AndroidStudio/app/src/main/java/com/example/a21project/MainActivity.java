package com.example.a21project;

import androidx.appcompat.app.AppCompatActivity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.TextView;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MainActivity extends AppCompatActivity {
    private TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = findViewById(R.id.checkText); // Получаем ссылку на TextView

        // Выполняем задачу с базой данных в фоновом потоке
        new DatabaseTask().execute();
    }

    private class DatabaseTask extends AsyncTask<Void, Void, String> {
        @Override
        protected String doInBackground(Void... voids) {
            StringBuilder result = new StringBuilder();
            Connection databaseConnect = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                databaseConnect = DatabaseConnection.getConnection();
                if (databaseConnect != null) {
                    statement = databaseConnect.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM coating");

                    while (resultSet.next()) {
                        String data = resultSet.getString("coatingtype"); // Замените на ваше фактическое имя столбца
                        result.append(data).append("\n"); // Добавляем данные в StringBuilder
                    }
                } else {
                    return "Ошибка соединения с базой данных.";
                }
            } catch (SQLException e) {
                return "Ошибка SQL: " + e.getMessage();
            } finally {
                // Закрываем ресурсы
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (databaseConnect != null) databaseConnect.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            return result.toString(); // Возвращаем результат
        }

        @Override
        protected void onPostExecute(String result) {
            // Устанавливаем текст в TextView
            textView.setText(result);
        }
    }
}