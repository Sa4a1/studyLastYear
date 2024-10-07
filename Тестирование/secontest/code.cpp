#include <iostream>

using namespace std;

bool isTriangelReal(float sideA, float sideB, float sideC)
{
	if (sideA < sideB + sideC || sideC < sideA + sideB || sideB < sideA + sideC) return true;
	else return false;
}

void typeOfTriangel(float sideA, float sideB, float sideC)
{
	if ((pow(sideA, 2) < pow(sideB, 2) + pow(sideC, 2)) && (pow(sideB, 2) < pow(sideC, 2) + pow(sideA, 2)) && (pow(sideC, 2) < pow(sideB, 2) + pow(sideA, 2))) cout << "Треугольник остроугольный\n";
	else if ((pow(sideA, 2) == pow(sideB, 2) + pow(sideC, 2)) || (pow(sideB, 2) == pow(sideC, 2) + pow(sideA, 2)) || (pow(sideC, 2) == pow(sideB, 2) + pow(sideA, 2))) cout << "Треугольник прямоугольный\n";
	else cout << "Треугольник тупоугольный\n";
}

void main()
{
	setlocale(LC_ALL, "ru");
	float a, b, c, square{NULL}, p{NULL};
	cout << "Введите сторону A:";
	a = cin >> a ? a : a = NULL;
	cout << "Введите сторону B:";
	b = cin >> b ? b : b = NULL;
	cout << "Введите сторону C:";
	c = cin >> c ? c : c = NULL;

	p = (a + b + c) / 2;
	square = sqrt(p * (p - a) * (p - b) * (p - c));

	if (a == NULL || b == NULL || c == NULL) cout << "Вы ввели символ\n";
	else
	{
		if (a > 0 && b > 0 && c > 0 && isTriangelReal(a, b, c)) 
		{ 
			cout << "Площадь треугольника:" << square << endl;
			typeOfTriangel(a, b, c);

		}
		else cout << "Треугольника не существует\n";
	}
}