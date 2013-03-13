require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ManufacturersController do

  # This should return the minimal set of attributes required to create a valid
  # Manufacturer. As you add validations to Manufacturer, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ManufacturersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all manufacturers as @manufacturers" do
      manufacturer = Manufacturer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:manufacturers).should eq([manufacturer])
    end
  end

  describe "GET show" do
    it "assigns the requested manufacturer as @manufacturer" do
      manufacturer = Manufacturer.create! valid_attributes
      get :show, {:id => manufacturer.to_param}, valid_session
      assigns(:manufacturer).should eq(manufacturer)
    end
  end

  describe "GET new" do
    it "assigns a new manufacturer as @manufacturer" do
      get :new, {}, valid_session
      assigns(:manufacturer).should be_a_new(Manufacturer)
    end
  end

  describe "GET edit" do
    it "assigns the requested manufacturer as @manufacturer" do
      manufacturer = Manufacturer.create! valid_attributes
      get :edit, {:id => manufacturer.to_param}, valid_session
      assigns(:manufacturer).should eq(manufacturer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Manufacturer" do
        expect {
          post :create, {:manufacturer => valid_attributes}, valid_session
        }.to change(Manufacturer, :count).by(1)
      end

      it "assigns a newly created manufacturer as @manufacturer" do
        post :create, {:manufacturer => valid_attributes}, valid_session
        assigns(:manufacturer).should be_a(Manufacturer)
        assigns(:manufacturer).should be_persisted
      end

      it "redirects to the created manufacturer" do
        post :create, {:manufacturer => valid_attributes}, valid_session
        response.should redirect_to(Manufacturer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved manufacturer as @manufacturer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Manufacturer.any_instance.stub(:save).and_return(false)
        post :create, {:manufacturer => {  }}, valid_session
        assigns(:manufacturer).should be_a_new(Manufacturer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Manufacturer.any_instance.stub(:save).and_return(false)
        post :create, {:manufacturer => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested manufacturer" do
        manufacturer = Manufacturer.create! valid_attributes
        # Assuming there are no other manufacturers in the database, this
        # specifies that the Manufacturer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Manufacturer.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => manufacturer.to_param, :manufacturer => { "these" => "params" }}, valid_session
      end

      it "assigns the requested manufacturer as @manufacturer" do
        manufacturer = Manufacturer.create! valid_attributes
        put :update, {:id => manufacturer.to_param, :manufacturer => valid_attributes}, valid_session
        assigns(:manufacturer).should eq(manufacturer)
      end

      it "redirects to the manufacturer" do
        manufacturer = Manufacturer.create! valid_attributes
        put :update, {:id => manufacturer.to_param, :manufacturer => valid_attributes}, valid_session
        response.should redirect_to(manufacturer)
      end
    end

    describe "with invalid params" do
      it "assigns the manufacturer as @manufacturer" do
        manufacturer = Manufacturer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Manufacturer.any_instance.stub(:save).and_return(false)
        put :update, {:id => manufacturer.to_param, :manufacturer => {  }}, valid_session
        assigns(:manufacturer).should eq(manufacturer)
      end

      it "re-renders the 'edit' template" do
        manufacturer = Manufacturer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Manufacturer.any_instance.stub(:save).and_return(false)
        put :update, {:id => manufacturer.to_param, :manufacturer => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested manufacturer" do
      manufacturer = Manufacturer.create! valid_attributes
      expect {
        delete :destroy, {:id => manufacturer.to_param}, valid_session
      }.to change(Manufacturer, :count).by(-1)
    end

    it "redirects to the manufacturers list" do
      manufacturer = Manufacturer.create! valid_attributes
      delete :destroy, {:id => manufacturer.to_param}, valid_session
      response.should redirect_to(manufacturers_url)
    end
  end

end
