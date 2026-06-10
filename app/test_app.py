from appflsk import app


def test_index():
    tester = app.test_client()
    response = tester.get('/')
    assert response.status_code == 200
    data = response.get_json()
    assert 'La conexión a la base de datos fue exitosa' in data['message']
