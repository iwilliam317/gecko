require 'test_helper'

class ReptilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reptile = reptiles(:one)
  end

  test "should get index" do
    get reptiles_url
    assert_response :success
  end

  test "should get new" do
    get new_reptile_url
    assert_response :success
  end

  test "should create reptile" do
    assert_difference('Reptile.count') do
      post reptiles_url, params: { reptile: { birthday: @reptile.birthday, gender: @reptile.gender, morphological_father: @reptile.morphological_father, morphological_mother: @reptile.morphological_mother, morphological_pattern: @reptile.morphological_pattern, name: @reptile.name, new_animal: @reptile.new_animal, specie: @reptile.specie, weight: @reptile.weight } }
    end

    assert_redirected_to reptile_url(Reptile.last)
  end

  test "should show reptile" do
    get reptile_url(@reptile)
    assert_response :success
  end

  test "should get edit" do
    get edit_reptile_url(@reptile)
    assert_response :success
  end

  test "should update reptile" do
    patch reptile_url(@reptile), params: { reptile: { birthday: @reptile.birthday, gender: @reptile.gender, morphological_father: @reptile.morphological_father, morphological_mother: @reptile.morphological_mother, morphological_pattern: @reptile.morphological_pattern, name: @reptile.name, new_animal: @reptile.new_animal, specie: @reptile.specie, weight: @reptile.weight } }
    assert_redirected_to reptile_url(@reptile)
  end

  test "should destroy reptile" do
    assert_difference('Reptile.count', -1) do
      delete reptile_url(@reptile)
    end

    assert_redirected_to reptiles_url
  end
end
