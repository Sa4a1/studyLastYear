using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace A21
{
    public class Cheker
    {
       public static bool PasswordCheck(string password)
        {
            bool correctPassword;
            int countNumeric = 0;
            int countLiteral = 0;
            bool isLowerLiteral = false;
            bool isUpperLiteral = false;

            for (int i = 0; i < password.Length; i++)
            {
                if (char.IsDigit(password[i])) countNumeric++;
                else countLiteral++;
                if (char.IsLower(password[i]) && char.IsLetter(password[i])) isLowerLiteral = true;
                if (char.IsUpper(password[i]) && char.IsLetter(password[i])) isUpperLiteral = true;
            }

            if((password.Length >= 8 || password.Length <= 20) && (isLowerLiteral && isUpperLiteral) && (countLiteral >= 2)) correctPassword = true;
            else correctPassword = false;
            return correctPassword;

        }
    }
}
