#include <iostream>

using namespace std;



void triangelCheker(float sideA, float sideB, float sideC)
{
	if (sideA == sideB && sideA == sideC) cout << "Треугольник равносторонний\n";
	else if ((sideA == sideB && sideB != sideC) || sideA == sideC || sideB == sideC) cout << "Треугольник равнобедренный\n";
	else cout << "Треугольник разносторонний\n";
	return;
}


bool isTriangelReal(float sideA, float sideB, float sideC) 
{
	if (sideA < sideB + sideC && sideC < sideA + sideB && sideB < sideA + sideC) return true;
	else return false;
}


void main()
{
	setlocale(LC_ALL, "ru");
	float a, b, c , square, p;
	cout << "Введите сторону А:" << endl;
	cin >> a;

	if (!cin.fail()) {
		cout << "Введите сторону B:" << endl;
		cin >> b;
	}

	if (!cin.fail()) {
		cout << "Введите сторону C:" << endl;
		cin >> c;
	}

    if (cin.fail()) cout << "Был введен символ\n"; 
	else 
	{
		if (a > 50 || b > 50 || c > 50) cout << "Вы вышли за верхнюю границу предела значений"; 
		else
		{
			p = (a + b + c) / 2;
			square = sqrt(p * (p - a) * (p - b) * (p - c));
			if (a > 0 && b > 0 && c > 0 && isTriangelReal(a, b, c))
			{
				cout << "Площадь треугольника:" << square << endl;
				triangelCheker(a, b, c);
			}
			else cout << "Треугольник не сущетсвует";
		}
	}
}