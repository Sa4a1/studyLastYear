#include <iostream>

using namespace std;



void triangelCheker(float sideA, float sideB, float sideC)
{
	if (sideA == sideB && sideA == sideC) cout << "����������� ��������������\n";
	else if ((sideA == sideB && sideB != sideC) || sideA == sideC || sideB == sideC) cout << "����������� ��������������\n";
	else cout << "����������� ��������������\n";
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
	cout << "������� ������� �:" << endl;
	cin >> a;

	if (!cin.fail()) {
		cout << "������� ������� B:" << endl;
		cin >> b;
	}

	if (!cin.fail()) {
		cout << "������� ������� C:" << endl;
		cin >> c;
	}

    if (cin.fail()) cout << "��� ������ ������\n"; 
	else 
	{
		if (a > 50 || b > 50 || c > 50) cout << "�� ����� �� ������� ������� ������� ��������"; 
		else
		{
			p = (a + b + c) / 2;
			square = sqrt(p * (p - a) * (p - b) * (p - c));
			if (a > 0 && b > 0 && c > 0 && isTriangelReal(a, b, c))
			{
				cout << "������� ������������:" << square << endl;
				triangelCheker(a, b, c);
			}
			else cout << "����������� �� ����������";
		}
	}
}