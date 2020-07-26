from django.http.response import JsonResponse

def Test(request):
	return JsonResponse({"message": "welcome to home page..."})
