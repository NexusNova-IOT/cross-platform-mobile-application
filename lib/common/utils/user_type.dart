enum UserType {
  ROLE_AGENCY,
  ROLE_TOURIST,
}

getRole(String role) {
  if (role == 'ROLE_AGENCY') {
    return UserType.ROLE_AGENCY;
  } else if (role == 'ROLE_TOURIST') {
    return UserType.ROLE_TOURIST;
  } else {
    return UserType.ROLE_TOURIST;
  }
}
