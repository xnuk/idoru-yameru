#include <Windows.h>
#include <gdiplus.h>
using namespace Gdiplus;
#pragma comment(lib, "Gdiplus.lib")
LPCTSTR lpszClass = TEXT("idoru-yameru");
LRESULT CALLBACK WndProc(HWND hWnd, UINT iMessage, WPARAM wParam, LPARAM lParam)
{
	HDC hdc;
	PAINTSTRUCT ps;
	switch (iMessage) {
	case WM_CREATE:
		RECT Rect;
		SetRect(&Rect, 0, 0, 1024, 576);
		AdjustWindowRect(&Rect, WS_OVERLAPPEDWINDOW, false);
		MoveWindow(hWnd, NULL, NULL, Rect.right - Rect.left, Rect.bottom - Rect.top, false);
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		Graphics graphics(hdc);
		Image image(L"idoru.jpg");
		graphics.DrawImage(&image, 0, 0);
		EndPaint(hWnd, &ps);
		break;
	}
	return DefWindowProc(hWnd, iMessage, wParam, lParam);
}
int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpszCmdParam, int nCmdShow)
{
	HWND hWnd;
	MSG Message;
	WNDCLASS WndClass;
	GdiplusStartupInput m_GdiplusStartupInput;
	ULONG_PTR m_GdiplusToken;
	GdiplusStartup(&m_GdiplusToken, &m_GdiplusStartupInput, NULL);
	WndClass.cbClsExtra = 0;
	WndClass.cbWndExtra = 0;
	WndClass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
	WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
	WndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
	WndClass.hInstance = hInstance;
	WndClass.lpfnWndProc = WndProc;
	WndClass.lpszClassName = lpszClass;
	WndClass.lpszMenuName = NULL;
	WndClass.style = CS_HREDRAW | CS_VREDRAW;
	RegisterClass(&WndClass);
	
	hWnd = CreateWindow(lpszClass, TEXT("나 아이돌 그만둘래"), WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInstance, NULL);
	ShowWindow(hWnd, nCmdShow);
	while (GetMessage(&Message, NULL, NULL, NULL)) {
		TranslateMessage(&Message);
		DispatchMessage(&Message);
	}
	return 0;
}
