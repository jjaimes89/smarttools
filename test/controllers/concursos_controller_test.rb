require 'test_helper'

class ConcursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concurso = concursos(:one)
  end

  test "should get index" do
    get concursos_url
    assert_response :success
  end

  test "should get new" do
    get new_concurso_url
    assert_response :success
  end

  test "should create concurso" do
    assert_difference('Concurso.count') do
      post concursos_url, params: { concurso: { banner: @concurso.banner, fecha_fin: @concurso.fecha_fin, fecha_inicio: @concurso.fecha_inicio, namec: @concurso.namec, premio: @concurso.premio, url: @concurso.url } }
    end

    assert_redirected_to concurso_url(Concurso.last)
  end

  test "should show concurso" do
    get concurso_url(@concurso)
    assert_response :success
  end

  test "should get edit" do
    get edit_concurso_url(@concurso)
    assert_response :success
  end

  test "should update concurso" do
    patch concurso_url(@concurso), params: { concurso: { banner: @concurso.banner, fecha_fin: @concurso.fecha_fin, fecha_inicio: @concurso.fecha_inicio, namec: @concurso.namec, premio: @concurso.premio, url: @concurso.url } }
    assert_redirected_to concurso_url(@concurso)
  end

  test "should destroy concurso" do
    assert_difference('Concurso.count', -1) do
      delete concurso_url(@concurso)
    end

    assert_redirected_to concursos_url
  end
end
