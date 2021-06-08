package com.teamproject;

import java.io.IOException;
import java.security.InvalidKeyException;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

public class GeoCoding {
	public static Float[] geoCoding(String location) throws InvalidKeyException {
		
		if (location == null)  
			
		return null;
		String id = "710475213508-1ssjkh0ul5p22fhosvl6h50iq8en5c02.apps.googleusercontent.com";
		String key = "QCTSW8ELvUUMAhNjwtNxP_-V";
		Geocoder geocoder = new Geocoder(id,key);
		
	
		// setAddress : 변환하려는 주소 (경기도 성남시 분당구 등)

		// setLanguate : 인코딩 설정

		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
	
		GeocodeResponse geocoderResponse;

		try {

		geocoderResponse = geocoder.geocode(geocoderRequest);
		System.out.println(geocoderRequest);
		if (geocoderResponse.getStatus() == GeocoderStatus.OK & !geocoderResponse.getResults().isEmpty()) {

			GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
			
			LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();

			  

			Float[] coords = new Float[2];

			coords[0] = latitudeLongitude.getLat().floatValue();

			coords[1] = latitudeLongitude.getLng().floatValue();

			return coords;

			}

			} catch (IOException ex) {

			ex.printStackTrace();

			}

			return null;

			}


			
	public static void main(String[] args) throws InvalidKeyException {
		// TODO Auto-generated method stub
		String location =  "대전 광역시 유성구 궁동" ;

		Float[] coords = geoCoding(location);

		System.out.println(coords);
		//System.out.println(location + ": " + coords[0] + ", " + coords[1]);

	}

}
