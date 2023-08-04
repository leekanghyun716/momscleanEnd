package com.mom.client.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
    private int userNo;

    @NotBlank(message = "아이디를 입력하세요")
    @Pattern(regexp = "^[a-zA-Z0-9_-]{4,20}$", message = "4~20자 이내의 영문 소문자, 숫자, 특수기호(_)(-)만 사용 가능합니다")
    private String userId;

    @NotBlank(message = "비밀번호를 입력하세요")
    @Size(min = 10, max = 20, message = "10~20자 이내의 영문 대소문자, 숫자, 특수문자 혼합만 사용 가능합니다")
    private String userPw;

    @NotBlank(message = "비밀번호 재확인을 입력하세요.")
    private String confirmPassword;

    @NotBlank(message = "회원 이름을 입력하세요")
    private String userName;

    @NotBlank(message = "전화번호를 입력하세요")
    @Pattern(regexp = "^[0-9]{11}$", message = "숫자로만 11자를 입력하세요")
    private String userPhone;

    @NotBlank(message = "이메일을 입력하세요")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "올바른 이메일 주소를 입력하세요")
    private String userEmail;

    //@NotBlank(message = "회원 구분을 입력하세요")
    //@NotNull(message = "회원 구분을 선택하세요")
    private String userDivision;

    private boolean emailAuth;

    private boolean agreement1;

    private boolean agreement2;
}
