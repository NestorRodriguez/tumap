import { TestBed } from '@angular/core/testing';

import { HidroServicesService } from './hidro-services.service';

describe('HidroServicesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: HidroServicesService = TestBed.get(HidroServicesService);
    expect(service).toBeTruthy();
  });
});
