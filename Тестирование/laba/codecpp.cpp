#include <iostream>

using namespace std;



void triangelCheker(float sideA, float sideB, float sideC)
{
	if (sideA == sideB && sideA == sideC) cout << "Треугольник равносторонний\n";
	else if ((sideA == sideB && sideB != sideC) || sideA == sideC || sideB == sideC) cout << "Треугольник равнобедренный\n";
	else cout << "Треугольник разнSAосторонний\n";
	return;
}


bool isTriangelReal(float sideA, float sideB, float sideC) 
{
	if (sideA < sideB + sideC || sideC < sideA + sideB || sideB < sideA + sideC) return true;
	else return false;
}


void main()
{
	setlocale(LC_ALL, "ru");
	float a, b, c square{ NULL }, p{ NULL };
	cout << "Введите длинну стороны A:";
	a = cin >> a ? a : a = NULL ;
	cout << "Введите длинну стороны B:";
	b = cin >> b ? b : b = NULL;
	cout << "Введите длинну стороны C:";
	c = cin >> c ? c : c = NULL;

	p = (a + b + c) / 2;
	square = sqrt(p * (p - a) * (p - b) * (p - c));

	if (a == NULL || b == NULL || c == NULL) cout << "Была введена буква\n";
	else 
	{
		if (a > 0 && b > 0 && c > 0 && isTriangelReal(a, b, c)) 
		{
			cout << "Площадь треугольника:" << square;
			triangelCheker(a, b, c);
		}
		else cout << "Треугольник не сущетсвует";
	}
}