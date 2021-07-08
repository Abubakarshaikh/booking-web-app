from server.models.address import AddressService
from server.models.events import EventService
from server.models.seat import SectionService, SeatService
from server.models.token_blacklist import TokenBlacklistService
from server.models.user import UserService, RoleService

address_service = AddressService()

event_service = EventService()

section_service = SectionService()
seat_service = SeatService()

user_service = UserService()
role_service = RoleService()
token_blacklist = TokenBlacklistService()
