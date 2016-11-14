require 'test_helper'

class ArchivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archivo = archivos(:one)
  end

  test "should get index" do
    get archivos_url
    assert_response :success
  end

  test "should get new" do
    get new_archivo_url
    assert_response :success
  end

  test "should create archivo" do
    assert_difference('Archivo.count') do
      post archivos_url, params: { archivo: { apellidos: @archivo.apellidos, email: @archivo.email, estado: @archivo.estado, mensaje: @archivo.mensaje, nombres: @archivo.nombres, video: @archivo.video } }
    end

    assert_redirected_to archivo_url(Archivo.last)
  end

  test "should show archivo" do
    get archivo_url(@archivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_archivo_url(@archivo)
    assert_response :success
  end

  test "should update archivo" do
    patch archivo_url(@archivo), params: { archivo: { apellidos: @archivo.apellidos, email: @archivo.email, estado: @archivo.estado, mensaje: @archivo.mensaje, nombres: @archivo.nombres, video: @archivo.video } }
    assert_redirected_to archivo_url(@archivo)
  end

  test "should destroy archivo" do
    assert_difference('Archivo.count', -1) do
      delete archivo_url(@archivo)
    end

    assert_redirected_to archivos_url
  end
end
