package com.teamproject;

import org.springframework.stereotype.Component;

@Component("vo")
public class RestaurantVO {
	String restaurantName,IndustryMenuInformation,StreetNameAddress,Address,RepresentativeMenu,
	takeout,reservation,prepayment,Wi_Fi,facilities_disabled,Parking,
	RestaurantID,RestaurantPhone,RestaurantArea,RestaurantLatitude,RestaurantHardness,AcceptanceAttitude,
	Naverpopularity,SeatsStanding,SeatsSeat,holiday;
	double distance;

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getIndustryMenuInformation() {
		return IndustryMenuInformation;
	}

	public void setIndustryMenuInformation(String industryMenuInformation) {
		IndustryMenuInformation = industryMenuInformation;
	}

	public String getStreetNameAddress() {
		return StreetNameAddress;
	}

	public void setStreetNameAddress(String streetNameAddress) {
		StreetNameAddress = streetNameAddress;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getRepresentativeMenu() {
		return RepresentativeMenu;
	}

	public void setRepresentativeMenu(String representativeMenu) {
		RepresentativeMenu = representativeMenu;
	}

	public String getTakeout() {
		return takeout;
	}

	public void setTakeout(String takeout) {
		this.takeout = takeout;
	}

	public String getReservation() {
		return reservation;
	}

	public void setReservation(String reservation) {
		this.reservation = reservation;
	}

	public String getPrepayment() {
		return prepayment;
	}

	public void setPrepayment(String prepayment) {
		this.prepayment = prepayment;
	}

	public String getWi_Fi() {
		return Wi_Fi;
	}

	public void setWi_Fi(String wi_Fi) {
		Wi_Fi = wi_Fi;
	}

	public String getFacilities_disabled() {
		return facilities_disabled;
	}

	public void setFacilities_disabled(String facilities_disabled) {
		this.facilities_disabled = facilities_disabled;
	}

	public String getParking() {
		return Parking;
	}

	public void setParking(String parking) {
		Parking = parking;
	}

	public String getRestaurantID() {
		return RestaurantID;
	}

	public void setRestaurantID(String restaurantID) {
		RestaurantID = restaurantID;
	}

	public String getRestaurantPhone() {
		return RestaurantPhone;
	}

	public void setRestaurantPhone(String restaurantPhone) {
		RestaurantPhone = restaurantPhone;
	}

	public String getRestaurantArea() {
		return RestaurantArea;
	}

	public void setRestaurantArea(String restaurantArea) {
		RestaurantArea = restaurantArea;
	}

	public String getRestaurantLatitude() {
		return RestaurantLatitude;
	}

	public void setRestaurantLatitude(String restaurantLatitude) {
		RestaurantLatitude = restaurantLatitude;
	}

	public String getRestaurantHardness() {
		return RestaurantHardness;
	}

	public void setRestaurantHardness(String restaurantHardness) {
		RestaurantHardness = restaurantHardness;
	}

	public String getAcceptanceAttitude() {
		return AcceptanceAttitude;
	}

	public void setAcceptanceAttitude(String acceptanceAttitude) {
		AcceptanceAttitude = acceptanceAttitude;
	}

	public String getNaverpopularity() {
		return Naverpopularity;
	}

	public void setNaverpopularity(String naverpopularity) {
		Naverpopularity = naverpopularity;
	}

	public String getSeatsStanding() {
		return SeatsStanding;
	}

	public void setSeatsStanding(String seatsStanding) {
		SeatsStanding = seatsStanding;
	}

	public String getSeatsSeat() {
		return SeatsSeat;
	}

	public void setSeatsSeat(String seatsSeat) {
		SeatsSeat = seatsSeat;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RestaurantVO other = (RestaurantVO) obj;
		if (AcceptanceAttitude == null) {
			if (other.AcceptanceAttitude != null)
				return false;
		} else if (!AcceptanceAttitude.equals(other.AcceptanceAttitude))
			return false;
		if (Address == null) {
			if (other.Address != null)
				return false;
		} else if (!Address.equals(other.Address))
			return false;
		if (IndustryMenuInformation == null) {
			if (other.IndustryMenuInformation != null)
				return false;
		} else if (!IndustryMenuInformation.equals(other.IndustryMenuInformation))
			return false;
		if (Naverpopularity == null) {
			if (other.Naverpopularity != null)
				return false;
		} else if (!Naverpopularity.equals(other.Naverpopularity))
			return false;
		if (Parking == null) {
			if (other.Parking != null)
				return false;
		} else if (!Parking.equals(other.Parking))
			return false;
		if (RepresentativeMenu == null) {
			if (other.RepresentativeMenu != null)
				return false;
		} else if (!RepresentativeMenu.equals(other.RepresentativeMenu))
			return false;
		if (RestaurantArea == null) {
			if (other.RestaurantArea != null)
				return false;
		} else if (!RestaurantArea.equals(other.RestaurantArea))
			return false;
		if (RestaurantHardness == null) {
			if (other.RestaurantHardness != null)
				return false;
		} else if (!RestaurantHardness.equals(other.RestaurantHardness))
			return false;
		if (RestaurantID == null) {
			if (other.RestaurantID != null)
				return false;
		} else if (!RestaurantID.equals(other.RestaurantID))
			return false;
		if (RestaurantLatitude == null) {
			if (other.RestaurantLatitude != null)
				return false;
		} else if (!RestaurantLatitude.equals(other.RestaurantLatitude))
			return false;
		if (restaurantName == null) {
			if (other.restaurantName != null)
				return false;
		} else if (!restaurantName.equals(other.restaurantName))
			return false;
		if (RestaurantPhone == null) {
			if (other.RestaurantPhone != null)
				return false;
		} else if (!RestaurantPhone.equals(other.RestaurantPhone))
			return false;
		if (SeatsSeat == null) {
			if (other.SeatsSeat != null)
				return false;
		} else if (!SeatsSeat.equals(other.SeatsSeat))
			return false;
		if (SeatsStanding == null) {
			if (other.SeatsStanding != null)
				return false;
		} else if (!SeatsStanding.equals(other.SeatsStanding))
			return false;
		if (StreetNameAddress == null) {
			if (other.StreetNameAddress != null)
				return false;
		} else if (!StreetNameAddress.equals(other.StreetNameAddress))
			return false;
		if (Wi_Fi == null) {
			if (other.Wi_Fi != null)
				return false;
		} else if (!Wi_Fi.equals(other.Wi_Fi))
			return false;
		if (facilities_disabled == null) {
			if (other.facilities_disabled != null)
				return false;
		} else if (!facilities_disabled.equals(other.facilities_disabled))
			return false;
		if (holiday == null) {
			if (other.holiday != null)
				return false;
		} else if (!holiday.equals(other.holiday))
			return false;
		if (prepayment == null) {
			if (other.prepayment != null)
				return false;
		} else if (!prepayment.equals(other.prepayment))
			return false;
		if (reservation == null) {
			if (other.reservation != null)
				return false;
		} else if (!reservation.equals(other.reservation))
			return false;
		if (takeout == null) {
			if (other.takeout != null)
				return false;
		} else if (!takeout.equals(other.takeout))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "RestaurantVO [RestaurantName=" + restaurantName + ", IndustryMenuInformation=" + IndustryMenuInformation
				+ ", StreetNameAddress=" + StreetNameAddress + ", Address=" + Address + ", RepresentativeMenu="
				+ RepresentativeMenu + ", takeout=" + takeout + ", reservation=" + reservation + ", prepayment="
				+ prepayment + ", Wi_Fi=" + Wi_Fi + ", facilities_disabled=" + facilities_disabled + ", Parking="
				+ Parking + ", RestaurantID=" + RestaurantID + ", RestaurantPhone=" + RestaurantPhone
				+ ", RestaurantArea=" + RestaurantArea + ", RestaurantLatitude=" + RestaurantLatitude
				+ ", RestaurantHardness=" + RestaurantHardness + ", AcceptanceAttitude=" + AcceptanceAttitude
				+ ", Naverpopularity=" + Naverpopularity + ", SeatsStanding=" + SeatsStanding + ", SeatsSeat="
				+ SeatsSeat + ", holiday=" + holiday + ", distance=" + distance + "]";
	}


	public RestaurantVO(String restaurantName, String industryMenuInformation, String streetNameAddress, String address,
			String representativeMenu, String takeout, String reservation, String prepayment, String wi_Fi,
			String facilities_disabled, String parking, String restaurantID, String restaurantPhone,
			String restaurantArea, String restaurantLatitude, String restaurantHardness, String acceptanceAttitude,
			String naverpopularity, String seatsStanding, String seatsSeat, String holiday, double distance) {
		super();
		this.restaurantName = restaurantName;
		IndustryMenuInformation = industryMenuInformation;
		StreetNameAddress = streetNameAddress;
		Address = address;
		RepresentativeMenu = representativeMenu;
		this.takeout = takeout;
		this.reservation = reservation;
		this.prepayment = prepayment;
		Wi_Fi = wi_Fi;
		this.facilities_disabled = facilities_disabled;
		Parking = parking;
		RestaurantID = restaurantID;
		RestaurantPhone = restaurantPhone;
		RestaurantArea = restaurantArea;
		RestaurantLatitude = restaurantLatitude;
		RestaurantHardness = restaurantHardness;
		AcceptanceAttitude = acceptanceAttitude;
		Naverpopularity = naverpopularity;
		SeatsStanding = seatsStanding;
		SeatsSeat = seatsSeat;
		this.holiday = holiday;
		this.distance = distance;
	}

	public RestaurantVO() {}
	
}
